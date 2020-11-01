class ConsentsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @consent = @topic.consents.all
    render 'answers/new'
  end
    def show
      @topic = Topic.find(params[:topic_id])
      @consent = @topic.consents.find(params[:id])
    end
    def new
      @topic = Topic.find(params[:topic_id])
      @consent = @topic.consents.new
    end
    def edit
      @topic = Topic.find(params[:topic_id])
      @consent = @topic.consents.find(params[:id])
    end
    def create
        @topic = Topic.find(params[:topic_id])
        @consent = @topic.consents.create(consent_params)
        render 'answers/new'
      end
    def update
      @topic = Topic.find(params[:topic_id])
      @consent = @topic.consents.find(params[:id])

    if @consent.update(consent_params)
      redirect_to '/topics/'
    else
      render 'edit'
    end
    end

    def destroy
      @topic = Topic.find(params[:topic_id])
      @consent = @topic.consents.find(params[:id])
      @consent.destroy
      redirect_to '/topics/'
    end

    private
      def consent_params
        params.require(:consent).permit(:userid, :stoptime, :counttrue, :totaltime, :questionsall, :numberrand)
      end
end
