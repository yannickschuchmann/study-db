class ContentController < ApplicationController
  def intro
  end

  def completed
    cookies.delete(:auth_token)
  end
end
