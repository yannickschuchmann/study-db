class QuestionariesController < ApplicationController
  def debug
    @questionary = Questionary.find_by_name(params[:name])
    render "cases/questionaries/" + @questionary.name
  end
end
