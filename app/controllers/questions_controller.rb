class QuestionsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.all
  end
    def show
      @topic = Topic.find(params[:topic_id])
      @question = @topic.questions.find(params[:id])
    end

    def new
      @topic = Topic.find(params[:topic_id])
      @question = @topic.questions.new
    end

    def edit
      @topic = Topic.find(params[:topic_id])
      @question = @topic.questions.find(params[:id])
    end

    def create
        @topic = Topic.find(params[:topic_id])
        @question = @topic.questions.create(question_params)
        redirect_to '/topics/'
      end

    def update
      @topic = Topic.find(params[:topic_id])
      @question = @topic.questions.find(params[:id])

    if @question.update(question_params)
      redirect_to '/topics/'
    else
      render 'edit'
    end
    end

    def destroy
      @topic = Topic.find(params[:topic_id])
      @question = @topic.questions.find(params[:id])
      @question.destroy
      redirect_to '/topics/'
    end

    private
      def question_params
        params.require(:question).permit(:titlequestion, :imgquestion, :answertrue, :answer2, :answer3, :answer4)
      end
end
