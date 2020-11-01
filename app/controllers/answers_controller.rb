class AnswersController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @answer = @topic.answers.all
    render 'new'
  end
    def show
      @topic = Topic.find(params[:topic_id])
      @answer = @topic.answers.find(params[:id])
    end
    def new
      @topic = Topic.find(params[:topic_id])
      @answer = @topic.answers.new
    end
    def edit
      @topic = Topic.find(params[:topic_id])
      @answer = @topic.answers.find(params[:id])
    end
    def create
        @topic = Topic.find(params[:topic_id])
        @answer = @topic.answers.create(answer_params)
        render 'new'
      end
    def update
      @topic = Topic.find(params[:topic_id])
      @answer = @topic.answers.find(params[:id])

    if @answer.update(answer_params)
      redirect_to '/topics/'
    else
      render 'edit'
    end
    end

    def destroy
      @topic = Topic.find(params[:topic_id])
      @answer = @topic.answers.find(params[:id])
      @answer.destroy
      redirect_to '/topics/'
    end

    private
      def answer_params
        params.require(:answer).permit(:answeruser, :time, :questionid, :userid, :numberanswer, :usercode)
      end
end
