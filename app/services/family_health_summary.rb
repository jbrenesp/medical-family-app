# app/services/family_health_summary.rb
class FamilyHealthSummary
  attr_reader :year

  def initialize(family, family_member: nil, year: nil)
    @family = family
    @family_member = family_member
    @year = year || most_recent_year_with_data || Date.today.year
  end

  def illnesses_per_month
    illnesses_scope
    .where(start_date: Date.new(@year, 1, 1)..Date.new(@year, 12, 31))
    .group_by_month(:start_date, format: "%b")
    .count
  end

  def available_years
    illnesses_scope.pluck(:start_date).compact.map(&:year).uniq.sort.reverse
  end

  def pct_with_doctor_visit
    total = illnesses_scope.count
    return 0 if total.zero?
    (illnesses_scope.joins(:doctor_visits).distinct.count.to_f / total * 100).round
  end

  def pct_with_medication
    total = illnesses_scope.count
    return 0 if total.zero?
    (illnesses_scope.joins(:medications).distinct.count.to_f / total * 100).round
  end

  def top_recurring_illnesses
    illnesses_scope
      .group("LOWER(TRIM(name))")
      .count
      .sort_by { |_, c| -c }
      .first(5)
  end

  def medications_by_illness
    illnesses_scope
      .left_joins(:medications)
      .group("illnesses.id", "illnesses.name")
      .count("medications.id")
      .map { |(_id, name), count| { name: name, medication_count: count } }
      .sort_by { |h| -h[:medication_count] }
  end

  def active_medications_count
    medications_scope.where(end_date: nil).count
  end

  def checkups_by_type
    checkups_scope.group(:checkup_type).count
  end

  def days_since_last_checkup
    @family.family_members.map do |member|
      last = member.checkups.order(date: :desc).first
      { name: member.name, days_since: last ? (Date.today - last.date.to_date).to_i : nil }
    end
  end

  def doctor_visits_count
    return nil unless @family_member
    @family_member.doctor_visits.count
  end

  private

  def illnesses_scope
    @family_member ? @family_member.illnesses : Illness.where(family_member: @family.family_members)
  end

  def medications_scope
    @family_member ? @family_member.medications : Medication.where(family_member: @family.family_members)
  end

  def checkups_scope
    @family_member ? @family_member.checkups : Checkup.where(family_member: @family.family_members)
  end

  def most_recent_year_with_data
    illnesses_scope.pluck(:start_date).compact.map(&:year).max
  end
end
