module WizardHelper
  def wizard_step_tag index
    state = get_active_state
    class_names = ""

    if index == state
      class_names = "active"
    elsif index < state
      class_names = "completed"
    end

    ("<li class=\"%s\">%s</li>" % [class_names, index]).html_safe
  end

  def is_last_step
    get_active_state == Case.count + 1
  end

  private
    def get_active_state
      if @current_participant.nil?
        1
      elsif @current_participant.cases_completed?
        5
      else
        @current_participant.cases.length + 1
      end
    end
end