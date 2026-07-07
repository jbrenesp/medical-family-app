# OYN — On Your Notes

A family health tracking web application built with Ruby on Rails. OYN allows families to manage and track medical records for all family members in one place. This project was created as a solution to a real problem for me and my family, it will be used by my family and some friends to be sure that it will be usefull, maybe some day I will make it public. 

**Live Demo:** [www.onyournotes.com](https://www.onyournotes.com)




## Screenshots

### Home
<img width="1204" height="700" alt="Screenshot 2026-07-07 at 12 13 21 PM" src="https://github.com/user-attachments/assets/cc8c78ae-2fbc-4665-b5c4-f9ecc3846e6f" />

### Recruiter Page
<img width="1160" height="701" alt="Screenshot 2026-07-07 at 12 13 55 PM" src="https://github.com/user-attachments/assets/b90262c5-c8e0-47a9-b9ce-9bcc0579cdf2" />


### Family Member
<img width="1212" height="621" alt="Screenshot 2026-07-07 at 12 14 23 PM" src="https://github.com/user-attachments/assets/eabb9102-66c8-46fd-a115-45d0170e2a00" />


### Dashboard
<img width="1201" height="703" alt="Screenshot 2026-07-07 at 12 14 35 PM" src="https://github.com/user-attachments/assets/fd7a90bb-8e73-415b-96f3-918774e0c741" />


### Dashboard — Filtered by Member
<img width="1159" height="611" alt="Screenshot 2026-07-07 at 12 14 53 PM" src="https://github.com/user-attachments/assets/6a572fbd-99aa-4920-8527-67185027cecf" />


---

## Demo Account

Try the app without signing up:

| Field    | Value               |
|----------|---------------------|
| Email    | demo@example.com    |
| Password | Demo2026!           |

---

## Features

- **Family management** — create a family and add unlimited members (adults, children, pets)
- **Medical records** — track illnesses, doctor visits, medications, allergies, vaccines and checkups per family member
- **Health dashboard** — visualize illness by month and year, medication rates, recurring illness patterns, checkup history and active medications across the whole family or filtered by member
- **Security** — IDOR protection throughout, all queries scoped to the authenticated user's family
- **Authentication** — Devise-based authentication with custom failure handling

---

## Tech Stack

| Layer       | Technology                         |
|-------------|----------------------------------- |
| Framework   | Ruby on Rails 8.1                  |
| Database    | PostgreSQL                         |
| Auth        | Devise                             |
| Frontend    | Bootstrap 5.3                      |
| Testing     | RSpec, FactoryBot, Shoulda-matchers|
| Deployment  | Railway                            |

---

## Test Coverage

- 134 examples, 0 failures
- Model specs for all 9 models
- Request specs for all controllers including IDOR protection tests

---

## Local Setup

bash
git clone https://github.com/jbrenesp/medical-family-app
cd medical-family-app
bundle install
rails db:create db:migrate db:seed
rails server


Then visit http://localhost:3000 and log in with:
- Email: demo@example.com
- Password: Demo2026!

---

## Architecture Highlights

**IDOR Protection** — all database queries are scoped through current_user.family rather than trusting user-supplied params, preventing users from accessing other families' data.

**Service Object Pattern** — the dashboard uses a FamilyHealthSummary service object (app/services/family_health_summary.rb) to encapsulate all aggregation logic, keeping the controller thin and the queries independently testable.

---

## V2 Roadmap

- [ ] Pundit authorization (already installed, not yet implemented)
- [ ] `is_private` field on family members — hide sensitive records from other family users
- [ ] Doctor visit type as a dropdown (currently free text)
- [ ] Devise :timeoutable for automatic session expiry
- [ ] Chart.js visualizations on the dashboard
- [ ] Recruiter demo account auto-reset on logout
- [ ] Other features to be implemented after usage, even front end improvements. 

---

## Author

Built by [Jose Brenes](https://github.com/jbrenesp) — targeting a junior Ruby on Rails role.
