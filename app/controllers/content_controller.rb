class ContentController < ApplicationController
  def intro
  end

  def instructions
  end

  def completed
    cookies.delete(:auth_token)
  end
end
