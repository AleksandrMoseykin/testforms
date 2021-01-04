class AnswersController < ApplicationController
  before_action :authenticate_username!
  before_action :topic_find
  before_action :answers_find, only: [:show, :edit, :update, :destroy]

  def index
    @answer = @topic.answers.all
    render 'new'
  end

  def show
  end

  def new
    @answer = @topic.answers.new
  end

  def edit
  end

  def create
    @answer = @topic.answers.create(answer_params)
    render 'new'
  end

  def update
    if @answer.update(answer_params)
      redirect_to '/topics/'
    else
      render 'edit'
    end
  end

  def destroy
    @answer.destroy
    redirect_to '/topics/'
  end

  private

  def topic_find
    @topic = Topic.find(params[:topic_id])
  end

  def answers_find
    @answer = @topic.answers.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:answeruser, :time, :questionid, :userid, :numberanswer, :usercode)
  end
end
