class TopicsController < ApplicationController

  before_action :topic_find, only: [:show, :edit, :update, :destroy]

  def index
    @topics  = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to '/topics/'
    else
      render 'new'
    end
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to '/topics/'
  end

  private

  def topic_find
    @topic = Topic.find(params[:id])
  end

  def topic_params
      params.require(:topic).permit(:titletopic, :idreg, :codecreator, :countquestions, :sucquest, :timetask, :password, :ip, :email, :successmessage, :typetopic, :activ, :failuremessage, :intdate1, :intdate2, :rand)
  end
end
