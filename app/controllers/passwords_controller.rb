class PasswordsController < ApplicationController

  before_action :topic_find
  before_action :password_find, only: [:show, :edit, :update, :destroy]

  def index
    @password = @topic.passwords.all
    render 'answers/new'
  end

  def show
  end

  def new
    @password = @topic.passwords.new
  end

  def edit
  end

  def create
    @password = @topic.passwords.create(password_params)
    render 'answers/new'
  end

  def update
    if @password.update(password_params)
      redirect_to '/topics/'
    else
      render 'edit'
    end
  end

  def destroy
    @password.destroy
    redirect_to '/topics/'
  end

  private

  def topic_find
    @topic = Topic.find(params[:topic_id])
  end

  def password_find
    @password = @topic.passwords.find(params[:id])
  end

  def password_params
    params.require(:password).permit(:pasanswer, :pascount, :pasvalue, :userid)
  end
end
