class PasswordsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @password = @topic.passwords.all
  end
    def show
      @topic = Topic.find(params[:topic_id])
      @password = @topic.passwords.find(params[:id])
    end
    def new
      @topic = Topic.find(params[:topic_id])
      @password = @topic.passwords.new
    end
    def edit
      @topic = Topic.find(params[:topic_id])
      @password = @topic.passwords.find(params[:id])
    end
    def create
        @topic = Topic.find(params[:topic_id])
        @password = @topic.passwords.create(password_params)
        render 'answers/new'
      end
    def update
      @topic = Topic.find(params[:topic_id])
      @password = @topic.passwords.find(params[:id])

    if @password.update(password_params)
      redirect_to '/topics/'
    else
      render 'edit'
    end
    end

    def destroy
      @topic = Topic.find(params[:topic_id])
      @password = @topic.passwords.find(params[:id])
      @password.destroy
      redirect_to '/topics/'
    end

    private
      def password_params
        params.require(:password).permit(:pasanswer, :pascount, :pasvalue, :userid)
      end
end
