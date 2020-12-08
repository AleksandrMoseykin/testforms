class SettingsController < ApplicationController

  before_action :topic_find
  before_action :setting_find, only: [:show, :edit, :update, :destroy]

  def index
    @setting = @topic.settings.all
  end

  def show
  end

  def new
    @setting = @topic.settings.new
  end

  def edit
  end

  def create
    @setting = @topic.settings.create(setting_params)
    redirect_to '/topics/'
  end

  def update
    if @setting.update(setting_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    @setting.destroy
    redirect_to '/topics/'
  end

  private

  def topic_find
    @topic = Topic.find(params[:topic_id])
  end

  def setting_find
    @setting = @topic.settings.find(params[:id])
  end

  def setting_params
    params.require(:setting).permit(:agebefore, :ageafter, :counttrue, :accomplishment, :sex, :country)
  end
end
