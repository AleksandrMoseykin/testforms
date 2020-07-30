class SettingsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @setting = @topic.settings.all
  end
    def show
      @topic = Topic.find(params[:topic_id])
      @setting = @topic.settings.find(params[:id])
    end
    def new
      @topic = Topic.find(params[:topic_id])
      @setting = @topic.settings.new
    end
    def edit
      @topic = Topic.find(params[:topic_id])
      @setting = @topic.settings.find(params[:id])
    end
    def create
        @topic = Topic.find(params[:topic_id])
        @setting = @topic.settings.create(setting_params)
        redirect_to '/topics/'
      end
    def update
      @topic = Topic.find(params[:topic_id])
      @setting = @topic.settings.find(params[:id])

    if @setting.update(setting_params)
      render 'show'
    else
      render 'edit'
    end
    end

    def destroy
      @topic = Topic.find(params[:topic_id])
      @setting = @topic.settings.find(params[:id])
      @setting.destroy
      redirect_to '/topics/'
    end

    private
      def setting_params
        params.require(:setting).permit(:agebefore, :ageafter, :counttrue, :accomplishment, :sex, :country)
      end
end
