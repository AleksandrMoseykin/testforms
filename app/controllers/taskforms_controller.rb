class TaskformsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @taskforms  = Taskform.all
  end

  def show
    @taskform = Taskform.find(params[:id])
  end

  def new
    @taskform = Taskform.new
  end

  def edit
    @taskform = Taskform.find(params[:id])
  end

  def create
    @taskform = Taskform.new(taskform_params)

    if @taskform.save
      redirect_to '/taskforms/'
    else
      render 'new'
    end
  end

  def update
    @taskform = Taskform.find(params[:id])
  if @taskform.update(taskform_params)
    redirect_to @taskform
  else
    render 'edit'
  end
end

def destroy
  @taskform = Taskform.find(params[:id])
  @taskform.destroy

  redirect_to '/taskforms/'
end

  private
  def taskform_params
      params.require(:taskform).permit(:titletask, :countquestions, :timetask, :password, :idreg, :successmessage, :failuremessage, :activ, :sucquest, :email, :intdate1, :intdate2, :rand)
  end
end
