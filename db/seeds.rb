# db/seeds.rb


demo_user = User.find_by(email: "demo@example.com")
if demo_user
  Checkup.where(family_member: demo_user.family&.family_members).destroy_all
  Vaccine.where(family_member: demo_user.family&.family_members).destroy_all
  Allergy.where(family_member: demo_user.family&.family_members).destroy_all
  Medication.where(family_member: demo_user.family&.family_members).destroy_all
  DoctorVisit.where(family_member: demo_user.family&.family_members).destroy_all
  Illness.where(family_member: demo_user.family&.family_members).destroy_all
  FamilyMember.where(family: demo_user.family).destroy_all
  demo_user.family&.destroy
  demo_user.destroy
end
# ── Demo account ─────────────────────────────────────────────
user = User.find_or_create_by!(email: "demo@example.com") do |u|
  u.password = "Demo2026!"
  u.password_confirmation = "Demo2026!"
end

user.update!(
  password: "Demo2026!",
  password_confirmation: "Demo2026!"
)

# ── Family ───────────────────────────────────────────────────
family = Family.create!(name: "Johnson Family")
user.update!(family: family)

# ── Family members ───────────────────────────────────────────
sarah = FamilyMember.create!(
  name: "Sarah Johnson",
  member_type: "adult",
  date_of_birth: Date.new(1985, 3, 12),
  blood_type: "A+",
  is_private: false,
  family: family
)

tom = FamilyMember.create!(
  name: "Tom Johnson",
  member_type: "adult",
  date_of_birth: Date.new(1983, 7, 24),
  blood_type: "O+",
  is_private: false,
  family: family
)

lily = FamilyMember.create!(
  name: "Lily Johnson",
  member_type: "child",
  date_of_birth: Date.new(2015, 11, 5),
  blood_type: "A+",
  is_private: false,
  family: family
)

# ── Sarah — Illnesses ────────────────────────────────────────
flu_sarah_2024 = Illness.create!(
  name: "Flu",
  start_date: Date.new(2024, 1, 10),
  end_date: Date.new(2024, 1, 20),
  notes: "High fever, body aches, stayed home for a week.",
  family_member: sarah
)

Illness.create!(
  name: "Cold",
  start_date: Date.new(2024, 9, 3),
  end_date: Date.new(2024, 9, 10),
  notes: "Runny nose and sore throat, mild symptoms.",
  family_member: sarah
)

migraine_sarah_2025 = Illness.create!(
  name: "Migraine",
  start_date: Date.new(2025, 2, 14),
  end_date: Date.new(2025, 2, 16),
  notes: "Severe headache with light sensitivity.",
  family_member: sarah
)

Illness.create!(
  name: "Cold",
  start_date: Date.new(2025, 11, 20),
  end_date: Date.new(2025, 11, 27),
  notes: "Second cold this year, worse than the first.",
  family_member: sarah
)

back_pain_sarah = Illness.create!(
  name: "Lower Back Pain",
  start_date: Date.new(2026, 3, 5),
  end_date: nil,
  notes: "Ongoing, referred to physiotherapist.",
  family_member: sarah
)

# ── Sarah — Doctor visits ────────────────────────────────────
DoctorVisit.create!(
  visit_date: Date.new(2024, 1, 11),
  visit_type: "General Practitioner",
  doctor_name: "Dr. Martinez",
  doctor_city: "Madrid",
  notes: "Prescribed Tamiflu and rest.",
  illness: flu_sarah_2024,
  family_member: sarah
)

DoctorVisit.create!(
  visit_date: Date.new(2025, 2, 14),
  visit_type: "Neurology",
  doctor_name: "Dr. Martinez",
  doctor_city: "Madrid",
  notes: "Prescribed sumatriptan, follow up in 3 months.",
  illness: migraine_sarah_2025,
  family_member: sarah
)

DoctorVisit.create!(
  visit_date: Date.new(2026, 3, 8),
  visit_type: "General Practitioner",
  doctor_name: "Dr. Martinez",
  doctor_city: "Madrid",
  notes: "Referred to physiotherapy, prescribed ibuprofen.",
  illness: back_pain_sarah,
  family_member: sarah
)

# ── Sarah — Medications ──────────────────────────────────────
Medication.create!(
  name: "Tamiflu",
  medication_type: "Antiviral",
  start_date: Date.new(2024, 1, 11),
  end_date: Date.new(2024, 1, 16),
  notes: "5 day course for flu.",
  illness: flu_sarah_2024,
  family_member: sarah
)

Medication.create!(
  name: "Sumatriptan",
  medication_type: "Analgesic",
  start_date: Date.new(2025, 2, 14),
  end_date: nil,
  notes: "As needed for migraines.",
  illness: migraine_sarah_2025,
  family_member: sarah
)

Medication.create!(
  name: "Ibuprofen",
  medication_type: "Anti-inflammatory",
  start_date: Date.new(2026, 3, 8),
  end_date: nil,
  notes: "For lower back pain, take with food.",
  illness: back_pain_sarah,
  family_member: sarah
)

# ── Sarah — Allergies ────────────────────────────────────────
Allergy.create!(
  name: "Penicillin",
  allergy_type: "Drug",
  notes: "Rash and hives",
  severity: "moderate",
  diagnosed_date: Date.new(2010, 5, 1),
  family_member: sarah
)

Allergy.create!(
  name: "Pollen",
  allergy_type: "Environmental",
  notes: "Sneezing, watery eyes",
  severity: "mild",
  diagnosed_date: Date.new(2015, 3, 10),
  family_member: sarah
)

# ── Sarah — Vaccines ─────────────────────────────────────────
Vaccine.create!(
  name: "Influenza",
  vaccine_date: Date.new(2024, 10, 5),
  next_due_date: Date.new(2025, 10, 5),
  dose_number: 1,
  notes: "Annual flu shot.",
  family_member: sarah
)

Vaccine.create!(
  name: "Influenza",
  vaccine_date: Date.new(2025, 10, 3),
  next_due_date: Date.new(2026, 10, 3),
  dose_number: 1,
  notes: "Annual flu shot.",
  family_member: sarah
)

# ── Sarah — Checkups ─────────────────────────────────────────
Checkup.create!(
  checkup_type: "general",
  date: Date.new(2024, 5, 20),
  notes: "Blood pressure slightly elevated.",
  results: "BP 135/85, recommended lifestyle changes.",
  family_member: sarah
)

Checkup.create!(
  checkup_type: "blood_test",
  date: Date.new(2024, 5, 21),
  notes: "Fasting blood test.",
  results: "Cholesterol within normal range.",
  family_member: sarah
)

Checkup.create!(
  checkup_type: "general",
  date: Date.new(2025, 6, 15),
  notes: "Healthy overall.",
  results: "BP 125/80, recommended more exercise.",
  family_member: sarah
)

Checkup.create!(
  checkup_type: "vision",
  date: Date.new(2025, 8, 10),
  notes: "Routine vision check.",
  results: "Slight prescription change, new glasses ordered.",
  family_member: sarah
)

# ── Tom — Illnesses ──────────────────────────────────────────
Illness.create!(
  name: "Cold",
  start_date: Date.new(2024, 2, 5),
  end_date: Date.new(2024, 2, 12),
  notes: "Mild cold, resolved without medication.",
  family_member: tom
)

hypertension_tom = Illness.create!(
  name: "Hypertension",
  start_date: Date.new(2024, 6, 1),
  end_date: nil,
  notes: "Diagnosed during routine checkup, ongoing management.",
  family_member: tom
)

Illness.create!(
  name: "Cold",
  start_date: Date.new(2025, 1, 8),
  end_date: Date.new(2025, 1, 14),
  notes: "Similar to last year, recovered quickly.",
  family_member: tom
)

back_pain_tom = Illness.create!(
  name: "Lower Back Pain",
  start_date: Date.new(2025, 7, 22),
  end_date: Date.new(2025, 8, 10),
  notes: "Caused by heavy lifting at work.",
  family_member: tom
)

# ── Tom — Doctor visits ──────────────────────────────────────
DoctorVisit.create!(
  visit_date: Date.new(2024, 6, 1),
  visit_type: "General Practitioner",
  doctor_name: "Dr. Chen",
  doctor_city: "Madrid",
  notes: "Started on Lisinopril, lifestyle changes recommended.",
  illness: hypertension_tom,
  family_member: tom
)

DoctorVisit.create!(
  visit_date: Date.new(2024, 12, 10),
  visit_type: "Cardiology",
  doctor_name: "Dr. Chen",
  doctor_city: "Madrid",
  notes: "Blood pressure improving, continue medication.",
  illness: hypertension_tom,
  family_member: tom
)

DoctorVisit.create!(
  visit_date: Date.new(2025, 7, 23),
  visit_type: "General Practitioner",
  doctor_name: "Dr. Chen",
  doctor_city: "Madrid",
  notes: "Prescribed muscle relaxants and rest.",
  illness: back_pain_tom,
  family_member: tom
)

# ── Tom — Medications ────────────────────────────────────────
Medication.create!(
  name: "Lisinopril",
  medication_type: "Antihypertensive",
  start_date: Date.new(2024, 6, 1),
  end_date: nil,
  notes: "Daily, for hypertension management.",
  illness: hypertension_tom,
  family_member: tom
)

Medication.create!(
  name: "Cyclobenzaprine",
  medication_type: "Muscle Relaxant",
  start_date: Date.new(2025, 7, 23),
  end_date: Date.new(2025, 8, 10),
  notes: "Short course for back pain.",
  illness: back_pain_tom,
  family_member: tom
)

# ── Tom — Allergies ──────────────────────────────────────────
Allergy.create!(
  name: "Aspirin",
  allergy_type: "Drug",
  notes: "Stomach irritation",
  severity: "mild",
  diagnosed_date: Date.new(2018, 2, 1),
  family_member: tom
)

# ── Tom — Vaccines ───────────────────────────────────────────
Vaccine.create!(
  name: "Influenza",
  vaccine_date: Date.new(2024, 10, 8),
  next_due_date: Date.new(2025, 10, 8),
  dose_number: 1,
  notes: "Annual flu shot.",
  family_member: tom
)

Vaccine.create!(
  name: "Tetanus",
  vaccine_date: Date.new(2023, 4, 15),
  next_due_date: Date.new(2033, 4, 15),
  dose_number: 1,
  notes: "Booster after minor workplace injury.",
  family_member: tom
)

# ── Tom — Checkups ───────────────────────────────────────────
Checkup.create!(
  checkup_type: "general",
  date: Date.new(2024, 6, 1),
  notes: "Hypertension detected.",
  results: "BP 150/95, started treatment.",
  family_member: tom
)

Checkup.create!(
  checkup_type: "blood_test",
  date: Date.new(2024, 6, 2),
  notes: "Lipid panel and metabolic panel.",
  results: "LDL slightly elevated, monitoring.",
  family_member: tom
)

Checkup.create!(
  checkup_type: "general",
  date: Date.new(2024, 12, 10),
  notes: "Follow up for hypertension.",
  results: "BP 138/88, improving.",
  family_member: tom
)

Checkup.create!(
  checkup_type: "blood_test",
  date: Date.new(2025, 6, 20),
  notes: "Annual blood work.",
  results: "All within normal range.",
  family_member: tom
)

# ── Lily — Illnesses ─────────────────────────────────────────
ear_infection_lily = Illness.create!(
  name: "Ear Infection",
  start_date: Date.new(2024, 3, 10),
  end_date: Date.new(2024, 3, 22),
  notes: "Right ear, prescribed antibiotics.",
  family_member: lily
)

Illness.create!(
  name: "Cold",
  start_date: Date.new(2024, 10, 1),
  end_date: Date.new(2024, 10, 7),
  notes: "Caught from school, mild symptoms.",
  family_member: lily
)

flu_lily_2025 = Illness.create!(
  name: "Flu",
  start_date: Date.new(2025, 1, 15),
  end_date: Date.new(2025, 1, 25),
  notes: "High fever for 3 days, kept home from school.",
  family_member: lily
)

Illness.create!(
  name: "Cold",
  start_date: Date.new(2025, 9, 12),
  end_date: Date.new(2025, 9, 18),
  notes: "Back to school cold.",
  family_member: lily
)

# ── Lily — Doctor visits ─────────────────────────────────────
DoctorVisit.create!(
  visit_date: Date.new(2024, 3, 11),
  visit_type: "Pediatrics",
  doctor_name: "Dr. Patel",
  doctor_city: "Madrid",
  notes: "Right ear infection confirmed, prescribed Amoxicillin.",
  illness: ear_infection_lily,
  family_member: lily
)

DoctorVisit.create!(
  visit_date: Date.new(2025, 1, 16),
  visit_type: "Pediatrics",
  doctor_name: "Dr. Patel",
  doctor_city: "Madrid",
  notes: "Flu confirmed, prescribed Tamiflu, rest and fluids.",
  illness: flu_lily_2025,
  family_member: lily
)

# ── Lily — Medications ───────────────────────────────────────
Medication.create!(
  name: "Amoxicillin",
  medication_type: "Antibiotic",
  start_date: Date.new(2024, 3, 11),
  end_date: Date.new(2024, 3, 21),
  notes: "10 day course for ear infection.",
  illness: ear_infection_lily,
  family_member: lily
)

Medication.create!(
  name: "Tamiflu",
  medication_type: "Antiviral",
  start_date: Date.new(2025, 1, 16),
  end_date: Date.new(2025, 1, 21),
  notes: "5 day course for flu.",
  illness: flu_lily_2025,
  family_member: lily
)

Medication.create!(
  name: "Paracetamol",
  medication_type: "Analgesic",
  start_date: Date.new(2025, 1, 15),
  end_date: Date.new(2025, 1, 19),
  notes: "For fever management.",
  illness: flu_lily_2025,
  family_member: lily
)

# ── Lily — Allergies ─────────────────────────────────────────
Allergy.create!(
  name: "Dust Mites",
  allergy_type: "Environmental",
  notes: "Sneezing and itchy eyes",
  severity: "mild",
  diagnosed_date: Date.new(2019, 6, 1),
  family_member: lily
)

# ── Lily — Vaccines ──────────────────────────────────────────
Vaccine.create!(
  name: "MMR",
  vaccine_date: Date.new(2016, 11, 10),
  next_due_date: Date.new(2020, 11, 10),
  dose_number: 1,
  notes: "Measles, Mumps, Rubella — first dose.",
  family_member: lily
)

Vaccine.create!(
  name: "MMR",
  vaccine_date: Date.new(2020, 11, 15),
  next_due_date: nil,
  dose_number: 2,
  notes: "Second dose, series complete.",
  family_member: lily
)

Vaccine.create!(
  name: "Influenza",
  vaccine_date: Date.new(2024, 10, 12),
  next_due_date: Date.new(2025, 10, 12),
  dose_number: 1,
  notes: "Annual flu shot.",
  family_member: lily
)

Vaccine.create!(
  name: "Influenza",
  vaccine_date: Date.new(2025, 10, 10),
  next_due_date: Date.new(2026, 10, 10),
  dose_number: 1,
  notes: "Annual flu shot.",
  family_member: lily
)

# ── Lily — Checkups ──────────────────────────────────────────
Checkup.create!(
  checkup_type: "general",
  date: Date.new(2024, 4, 15),
  notes: "Annual pediatric checkup.",
  results: "Healthy and growing well, all milestones met.",
  family_member: lily
)

Checkup.create!(
  checkup_type: "dental",
  date: Date.new(2024, 6, 5),
  notes: "Routine dental checkup.",
  results: "No cavities, good brushing habits.",
  family_member: lily
)

Checkup.create!(
  checkup_type: "general",
  date: Date.new(2025, 4, 20),
  notes: "Annual pediatric checkup.",
  results: "Growing well, all milestones met.",
  family_member: lily
)

Checkup.create!(
  checkup_type: "vision",
  date: Date.new(2025, 9, 1),
  notes: "Routine vision check.",
  results: "Vision 20/20, no issues detected.",
  family_member: lily
)

puts "✅ Demo account seeded successfully"
puts "   Email:    demo@example.com"
puts "   Password: password123"
puts "   Family:   Johnson Family (Sarah, Tom, Lily)"
