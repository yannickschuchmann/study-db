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

  private
    def get_active_state
      unless @current_participant.nil? then @current_participant.cases.length + 1 else 1 end
    end
end