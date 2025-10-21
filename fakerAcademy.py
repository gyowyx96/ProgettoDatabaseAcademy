# Import delle librerie necessarie
import csv
import re
from pathlib import Path
import random
from datetime import datetime
from dateutil.relativedelta import relativedelta
from faker import Faker
from itertools import count

fake = Faker("it_IT")

N_USERINFOS = 100

# Crea una cartella di output con timestamp
def ts_outdir(base="csv_out"):
    t = datetime.now().strftime("%Y%m%d_%H%M")
    p = Path(f"{base}/AcademyDB_{t}")
    p.mkdir(parents=True, exist_ok=True)
    return p

    # Scrittura CSV
def write_csv(path, fieldnames, rows):
    with open(path, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fieldnames)
        w.writeheader()
        for r in rows:
            out = {}
            for k, v in r.items():
                if hasattr(v, "isoformat"):
                    out[k] = v.isoformat()
                elif v is None:
                    out[k] = "NULL"
                else:
                    out[k] = v
            w.writerow(out)

# Province e città siciliane
PROVINCE_SICILIA = {
    "Agrigento": ["Agrigento", "Canicattì", "Licata", "Favara", "Sciacca"],
    "Caltanissetta": ["Caltanissetta", "Gela", "Niscemi", "San Cataldo", "Mazzarino"],
    "Catania": ["Catania", "Acireale", "Paternò", "Adrano", "Misterbianco"],
    "Enna": ["Enna", "Piazza Armerina", "Leonforte", "Nicosia", "Barrafranca"],
    "Messina": ["Messina", "Barcellona Pozzo di Gotto", "Milazzo", "Patti", "Taormina"],
    "Palermo": ["Palermo", "Bagheria", "Monreale", "Termini Imerese", "Carini"],
    "Ragusa": ["Ragusa", "Modica", "Vittoria", "Comiso", "Scicli"],
    "Siracusa": ["Siracusa", "Augusta", "Noto", "Lentini", "Avola"],
    "Trapani": ["Trapani", "Marsala", "Mazara del Vallo", "Alcamo", "Castelvetrano"]
}
CORSI_MATERIE = [
    {
        "Corso": "Web Developer A.I.",
        "Materie": [
            "Fondamenti di informatica e programmazione",
            "Algoritmi e strutture dati",
            "HTML5, CSS3, JavaScript",
            "Framework front-end (React, Angular)",
            "Sviluppo back-end (Node.js, API REST, Database)",
            "Cloud computing",
            "Intelligenza artificiale applicata al web",
            "Machine Learning e Big Data",
            "DevOps e CI/CD",
            "Sicurezza applicativa e protezione dati",
            "UX/UI Design"
        ]
    },
    {
        "Corso": "Industry 4.0 & Smart Manufacturing",
        "Materie": [
            "Automazione industriale e sistemi meccatronici",
            "Controllori PLC e robotica industriale",
            "Sensori e attuatori",
            "Internet of Things (IoT) per la produzione",
            "Sistemi cyber-fisici e smart factory",
            "Manutenzione predittiva",
            "Analisi dei dati di produzione",
            "Qualità e sicurezza sul lavoro",
            "Normative e certificazioni industriali",
            "Progettazione e integrazione macchine"
        ]
    },
    {
        "Corso": "Web & Cyber Security",
        "Materie": [
            "Architetture di rete e sistemi operativi",
            "Crittografia e protocolli sicuri",
            "Sicurezza delle infrastrutture IT",
            "Penetration testing e ethical hacking",
            "Sicurezza applicativa e vulnerabilità web",
            "Incident response e digital forensics",
            "Sicurezza by design nei servizi digitali",
            "Normative GDPR e privacy",
            "Cloud e sicurezza dei dati"
        ]
    },
    {
        "Corso": "Digital Media Design",
        "Materie": [
            "Design grafico e comunicazione visiva",
            "User Experience (UX) e User Interface (UI)",
            "Motion graphics e animazione 2D/3D",
            "Realtà virtuale (VR) e aumentata (AR)",
            "Produzione multimediale e video editing",
            "Prototipazione digitale",
            "Web design responsivo",
            "Storytelling e comunicazione visiva",
            "Strumenti di design (Adobe, Blender, ecc.)"
        ]
    },
    {
        "Corso": "A.I. & Data Analysis",
        "Materie": [
            "Statistica e probabilità per data science",
            "Big Data e data warehouse",
            "Machine Learning e Deep Learning",
            "Data visualization e dashboarding",
            "Analisi predittiva e modelli statistici",
            "Etica dei dati e data governance",
            "Business Intelligence e cloud analytics",
            "Python per analisi dati"
        ]
    },
    {
        "Corso": "Tecnico TBM (Tunnel Boring Machine)",
        "Materie": [
            "Fondamenti di meccanica e idraulica",
            "Componenti e funzionamento TBM",
            "Sistemi meccatronici per infrastrutture",
            "Controlli automatici e sensoristica",
            "Manutenzione e diagnostica predittiva",
            "Sicurezza cantieri e normativa tecnica",
            "Disegno tecnico e CAD"
        ]
    }
]
N_SITES = 20
N_USERINFOS = 200
N_TUTORS = 5
# Genera le materie
def gen_subjects():
    subjects = []
    subject_id = count(1)
    for corso in CORSI_MATERIE:
        for materia in corso["Materie"]:
            subjects.append({
                "SubjectID": next(subject_id),
                "SubjectName": materia,
                "isDeleted": 0
            })
    return subjects

# Genera le province
def gen_province():
    return [
        {
            "ProvinceID": i + 1,
            "ProvinceName": name,
            "isDeleted": 0
        }
        for i, name in enumerate(PROVINCE_SICILIA.keys())
    ]

# Genera le città associate alle province
def gen_cities():
    cities = []
    city_id = count(1)
    for province_id, (province_name, city_list) in enumerate(PROVINCE_SICILIA.items(), start=1):
        for city in city_list:
            cities.append({
                "CityID": next(city_id),
                "ProvinceID": province_id,
                "CityName": city,
                "isDeleted": 0
            })
    return cities

def gen_sites(cities):
    sites = []
    site_id = count(1)
    used_names = set()  # tiene traccia dei nomi già usati
    
    for _ in range(min(N_SITES, len(cities))):
        city = random.choice(cities)

        # Nome base
        base_name = f"Sede di {city['CityName']}"
        site_name = base_name
        counter = 2
        
        # Se il nome esiste già, aggiungi indice progressivo
        while site_name in used_names:
            site_name = f"{base_name} {counter}"
            counter += 1
        
        # Registra il nome usato
        used_names.add(site_name)
        
        sites.append({
            "SiteID": next(site_id),
            "CityID": city["CityID"],
            "SiteName": site_name,
            "SiteAddress": fake.street_address().replace("\n", ", "),
            "isDeleted": 0
        })
    return sites

def gen_UserInfos(cities):
    return [
        {
            "UserInfoID": i + 1,
            "FirstName": fake.first_name(),
            "LastName": fake.last_name(),
            "Email": fake.unique.email(),
            "PhoneNumber": fake.unique.phone_number(),
            "BirthDate": fake.date_of_birth(minimum_age=18, maximum_age=65),
            "UserAddress": fake.street_address().replace("\n", ", "),
            "CityID": random.choice(cities)["CityID"],
            "isDeleted": 0
        }
        for i in range(N_USERINFOS)
    ]

def gen_tutors(n, userInfos):
    users = random.sample(userInfos, n)
    return [
        {
            "TutorID": i + 1,
            "UserInfoID": ui["UserInfoID"],
            "HireDate": fake.date_between(start_date='-4y', end_date='-2m'),
            "isDeleted": None
        }
        for i, ui in enumerate(users)
    ]

# Funzione principale
def __main__():
    outdir = ts_outdir()
    
    provinces = gen_province()
    cities = gen_cities()
    subjects = gen_subjects()

    sites = gen_sites(cities)
    userInfos = gen_UserInfos(cities)
    tutors = gen_tutors(N_TUTORS, userInfos)

    write_csv(outdir / "1-provinces.csv", provinces[0].keys(), provinces)
    write_csv(outdir / "2-cities.csv", cities[0].keys(), cities)
    write_csv(outdir / "3-subjects.csv", subjects[0].keys(), subjects)
    write_csv(outdir / "4-sites.csv", sites[0].keys(), sites)
    write_csv(outdir / "5-userInfos.csv", userInfos[0].keys(), userInfos)
    write_csv(outdir / "6-tutors.csv", tutors[0].keys(), tutors)

    print(f"✅ File salvati in: {outdir.resolve()}")
    

# Esegui lo script
if __name__ == "__main__":
    __main__()
