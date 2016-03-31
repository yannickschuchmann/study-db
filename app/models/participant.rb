class Participant < ApplicationRecord
  enum age: { "10-20": 0, "21-30": 1, "31-40": 2, "41-50": 3, "51-60": 4, "61-70": 5, "71-99": 6 }
  enum gender: { male: 0, female: 1 }
  enum web_usage: { "sehr oft": 0, "oft": 1, "manchmal": 2, "selten": 3, "fast nie": 4 }
  enum computer_usage: { "sehr gut": 0, "gut": 1, "durchschnittlich": 2, "eher schlecht": 3, "schlecht": 4 }

  has_one :profession, dependent: :destroy
  has_many :trackings
  has_many :cases,  -> { uniq }, through: :trackings
  has_many :answers
  has_many :polls

  validates :age, presence: true
  validates :gender, presence: true
  validates :web_usage, presence: true
  validates :computer_usage, presence: true

  accepts_nested_attributes_for :profession

  before_create :generate_cases_order
  before_create :generate_case_sheets_order

  def cases_completed?
    if self.cases.count == Case.count
      all_completed = true
      self.cases.each {|c| all_completed = false unless c.completed?(self)}
      return all_completed
    else
      return false
    end
  end

  def completed?
    if self.cases_completed?
      self.polls.each do |poll|
        return true if poll.questionary.name == "conclusion"
      end
    end

    return false
  end

  def self.completed?
    all.select do |item|
      item.completed?
    end
  end

  def self.furfm mail
    true
  end

  def self.as_csv mail
    column_fields = ["age", "gender", "web_usage", "computer_usage"]

    cases = Case.all
    trackings = Tracking.all
    answers = Answer.all
    questionaries = Questionary.where(name: ["nasatlx", "attrakdiff"])

    time_fields = []
    error_fields = []
    question_fields = []
    cases.each do |c|
      time_fields += (1..Case.sheets).map do |sheet|
        "c#{c.id}_s#{sheet}_time"
      end
      error_fields += (1..Case.sheets).map do |sheet|
        "c#{c.id}_s#{sheet}_error"
      end

      questionaries.each do |questionary|
        question_fields += questionary.questions.reject {|q| q.label == "Anmerkungen"}.map do |question|
          "c#{c.id}_#{questionary.name}_#{question.label}".gsub(" ", "_")
        end
      end
    end

    conclusion_question = Questionary.find_by_name("conclusion").questions.first
    question_fields << conclusion_question.label

    column_fields += time_fields + error_fields + question_fields


    csv = CSV.generate do |csv|
      csv << column_fields
      self.completed?.each do |item|
        values = []

        # age
        values << self.ages[item.age]
        # gender
        values << self.genders[item.gender]
        # web_usage
        values << self.web_usages[item.web_usage]
        # computer_usage
        values << self.computer_usages[item.computer_usage]

        # cases
        time_fields = []
        error_fields = []
        question_fields = []
        cases.each do |c|
          (1..Case.sheets).map do |sheet|
            t = trackings.where(participant_id: item.id, case_sheet: sheet, case_id: c.id).first
            time_fields.push(t.time)
            error_fields.push(t.error_counter)

          end
          questionaries.each do |questionary|
            question_fields += questionary.questions.reject {|q| q.label == "Anmerkungen"}.map do |question|
              answer = answers.where(question_id: question.id, participant_id: item.id, case_id: c.id).first
              question.kind == 'text' ? answer.text.gsub('\n', '') : answer.value
            end
          end
        end

        question_fields << conclusion_question.answers.where(participant_id: item.id).first.value
        values += time_fields + error_fields + question_fields

        csv << values
      end
    end

    ExportMailer.csv_email(mail, csv).deliver_now unless mail == false

    return csv
  end


  private

  def generate_cases_order
    self.cases_order = (1..Case.count).to_a.shuffle.to_s
  end

  def generate_case_sheets_order
    self.sheet_order = (1..Case.sheets).to_a.shuffle.to_s
  end
end
