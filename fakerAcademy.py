# Import delle librerie necessarie
import csv
import re
import hashlib
from pathlib import Path
import random
from datetime import datetime
from dateutil.relativedelta import relativedelta
from faker import Faker
from itertools import count

fake = Faker("it_IT")
random.seed(1)
Faker.seed(1)

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
            "Data Management e SQL",
            "Data analysis per sviluppatori",
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
N_SITES = 10
N_USERINFOS = 200
N_TUTORS = 5
N_TEACHERS = 20
N_COURSES = 10
N_STUDENTS = 100
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
    users = []
    for i in range(N_USERINFOS):
        plain = fake.password()
        hashed = hashlib.sha256(plain.encode('utf-8')).hexdigest()
        users.append(
        {
            "UserInfoID": i + 1,
            "FirstName": fake.first_name(),
            "LastName": fake.last_name(),
            "Email": fake.unique.email(),
            "PasswordHash": hashed,
            "PhoneNumber": fake.unique.phone_number(),
            "BirthDate": fake.date_of_birth(minimum_age=18, maximum_age=65),
            "UserAddress": fake.street_address().replace("\n", ", "),
            "CityID": random.choice(cities)["CityID"],
            "isDeleted": 0
        })
    # Aggiunta di un utente specifico (u Prof)
    users.append({ 
        "UserInfoID": N_USERINFOS + 1, 
        "FirstName": "Roberto", 
        "LastName": "Bologna", 
        "Email":"bobologna@gmfake.com",
        "PasswordHash": hashlib.sha256(fake.password().encode('utf-8')).hexdigest(),
        "PhoneNumber": fake.unique.phone_number(),
        "BirthDate": fake.date_of_birth(minimum_age=18, maximum_age=65),
        "UserAddress": fake.street_address().replace("\n", ", "),
        "CityID": 11,
        "isDeleted": 0})
    
    return users

def gen_tutors(n, userInfos):
    users = random.sample(userInfos, n)
    return [
        {
            "TutorID": i + 1,
            "UserInfoID": ui["UserInfoID"],
            "HireDate": fake.date_between(start_date='-4y', end_date='-2m'),
            "isDeleted": 0
        }
        for i, ui in enumerate(users)
    ]

def gen_Teachers(n, userInfos):
    teacher = []
    users = random.sample(userInfos, n)
    for i, ui in enumerate(users):
        teacher.append(
        {
            "TeacherID": i + 1,
            "UserInfoID": ui["UserInfoID"],
            "HireDate": fake.date_between(start_date='-5y', end_date='-1m'),
            "isDeleted": 0
        })

    teacher.append({ "TeacherID": n + 1, "UserInfoID": N_USERINFOS + 1, "HireDate": fake.date_between(start_date='-5y', end_date='-1m'), "isDeleted": 0 })
    return teacher

def gen_courses(n, sites, tutors):
    courses = []
    course_id = count(1)
    counter = 28

    for _ in range(n):
        corso_base = random.choice(CORSI_MATERIE)
        course_name = f"Corso di {corso_base['Corso']}"
        counter += 1

        site = random.choice(sites)
        tutor = random.choice(tutors)
        start_date = fake.date_between(start_date='-4y', end_date='-3m')
        end_date = start_date + relativedelta(years=+2)

        if end_date > datetime.now().date():
            end_date = None

        courses.append({
            "CourseID": next(course_id),
            "CourseName": course_name,
            "CourseNumber": counter,
            "SiteID": site["SiteID"],
            "TutorID": tutor["TutorID"],
            "StartDate": start_date,
            "EndDate": end_date,
            "isDeleted": 0
        })
    return courses

def gen_modules(courses, subjects, teachers):
    modules = []
    module_id = count(1)

    # Mappa: nome base del corso → SubjectID delle materie
    subject_map = {}
    for corso in CORSI_MATERIE:
        subject_map[corso["Corso"]] = [
            s["SubjectID"] for s in subjects if s["SubjectName"] in corso["Materie"]
        ]

    for course in courses:
        # Estrai il nome base del corso, rimuovendo "Corso di " e il numero finale
        base_name = course["CourseName"]
        if base_name.startswith("Corso di "):
            base_name = base_name.replace("Corso di ", "").strip()
        # Rimuove eventuale numero alla fine (es. "Web Developer A.I. 2" → "Web Developer A.I.")
        base_name = re.sub(r"\s+\d+$", "", base_name)

        valid_subject_ids = subject_map.get(base_name, [])
        if not valid_subject_ids:
            continue  # nessuna materia trovata → salta

        for subject_id in valid_subject_ids:
            teacher = random.choice(teachers)
            modules.append({
                "ModuleID": next(module_id),
                "CourseID": course["CourseID"],
                "TeacherID": teacher["TeacherID"],
                "SubjectID": subject_id,
                "ModuleHours": random.choice([20, 30, 40, 50, 60, 70, 80]),
                "isDeleted": 0
            })

    return modules


def gen_students(n, userInfos, courses, teachers, tutors):
    # Ottieni gli ID utenti già usati da teacher e tutor
    excluded_ids = {t["UserInfoID"] for t in teachers} | {t["UserInfoID"] for t in tutors}
    
    # Filtra userInfos escludendo questi utenti
    eligible_users = [ui for ui in userInfos if ui["UserInfoID"] not in excluded_ids]
    
    # Se n > utenti disponibili, limita per evitare errori
    n = min(n, len(eligible_users))
    users = random.sample(eligible_users, n)

    return [
        {
            "StudentID": i + 1,
            "UserInfoID": ui["UserInfoID"],
            "CourseID": random.choice(courses)["CourseID"],
            "isDeleted": 0
        }
        for i, ui in enumerate(users)
    ]

def gen_grades(students, modules, courses):
    grades = []
    grade_id = count(1)

    # Mappa veloce: CourseID → EndDate
    course_end_dates = {c["CourseID"]: c["EndDate"] for c in courses}
    today = datetime.now().date()

    for student in students:
        student_modules = [m for m in modules if m["CourseID"] == student["CourseID"]]
        course_end = course_end_dates[student["CourseID"]]

        for module in student_modules:
            # Se il corso non è ancora finito → voto solo a volte (probabilità bassa)
            if course_end is None or (course_end > today):
                grade_value = random.choice([None, None, None, random.randint(4, 10)])  # 75% None
                if grade_value is None:
                    continue
            else:
                grade_value = random.randint(4, 10)

            grades.append({
                "GradeID": next(grade_id),
                "StudentID": student["StudentID"],
                "ModuleID": module["ModuleID"],
                "GradeValue": grade_value,
                "isDeleted": 0
            })
    return grades

# Funzione principale
def __main__():
    outdir = ts_outdir()
    
    provinces = gen_province()
    cities = gen_cities()
    subjects = gen_subjects()

    sites = gen_sites(cities)
    userInfos = gen_UserInfos(cities)
    tutors = gen_tutors(N_TUTORS, userInfos)
    teachers = gen_Teachers(N_TEACHERS, userInfos)

    courses = gen_courses(N_COURSES, sites, tutors)
    modules = gen_modules(courses, subjects, teachers)
    students = gen_students(N_STUDENTS, userInfos, courses, teachers, tutors)
    grades = gen_grades(students, modules, courses)

    write_csv(outdir / "1-provinces.csv", provinces[0].keys(), provinces)
    write_csv(outdir / "2-cities.csv", cities[0].keys(), cities)
    write_csv(outdir / "3-subjects.csv", subjects[0].keys(), subjects)
    write_csv(outdir / "4-sites.csv", sites[0].keys(), sites)
    write_csv(outdir / "5-userInfos.csv", userInfos[0].keys(), userInfos)
    write_csv(outdir / "6-tutors.csv", tutors[0].keys(), tutors)
    write_csv(outdir / "7-teachers.csv", teachers[0].keys(), teachers)
    write_csv(outdir / "8-courses.csv", courses[0].keys(), courses)
    write_csv(outdir / "9-modules.csv", modules[0].keys(), modules)
    write_csv(outdir / "10-students.csv", students[0].keys(), students)
    write_csv(outdir / "11-grades.csv", grades[0].keys(), grades)

    print(f"✅ File salvati in: {outdir.resolve()}")
    

# Esegui lo script
if __name__ == "__main__":
    __main__()
