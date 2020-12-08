class ConsentsController < ApplicationController

  before_action :topic_find
  before_action :consents_find, only: [:show, :edit, :update, :destroy]

  def index
    @consent = @topic.consents.all
    render 'answers/new'
  end

  def show
  end

  def new
    @consent = @topic.consents.new
  end

  def edit
  end

  def create
    @consent = @topic.consents.create(consent_params)
    if @topic.save
      render 'answers/new'
    else
      render 'new'
    end
  end

  def update
    if @consent.update(consent_params)
      redirect_to '/topics/'
    else
      render 'edit'
    end
  end

  def destroy
    @consent.destroy
    redirect_to '/topics/'
  end

  private

    def topic_find
      @topic = Topic.find(params[:topic_id])
    end

    def consents_find
      @consent = @topic.consents.find(params[:id])
    end

    def consent_params
      params.require(:consent).permit(:userid, :stoptime, :counttrue, :totaltime, :questionsall, :numberrand, :code)
    end
end
