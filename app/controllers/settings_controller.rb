class SettingsController < ApplicationController
  def set
    setting = Setting.find_by_name(params[:name])
    if setting.present?
      setting[params[:field]] = params[:value]
      if setting.save
        redirect_to root_path
        return
      end
    end
    redirect_to root_path, :flash => {:error => "Couldn't set setting."}
  end
end
