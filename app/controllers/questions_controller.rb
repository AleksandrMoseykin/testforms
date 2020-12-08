class QuestionsController < ApplicationController

  before_action :topic_find
  before_action :questions_find, only: [:show, :edit, :update, :destroy]

  def index
    @question = @topic.questions.all
  end

  def show
  end

  def new
    @question = @topic.questions.new
  end

  def edit
  end

  def create
    @question = @topic.questions.create(question_params)

    if @question.save
      redirect_to '/topics/'
    else
      render 'new'
    end
  end

  def update
    if @question.update(question_params)
      redirect_to '/topics/'
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to '/topics/'
  end

  private

    def topic_find
      @topic = Topic.find(params[:topic_id])
    end

    def questions_find
      @question = @topic.questions.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:titlequestion, :imgquestion, :answertrue, :answer2, :answer3, :answer4)
    end
end
