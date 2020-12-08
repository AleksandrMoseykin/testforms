class AcceptsController < ApplicationController
  def index
    @taskform = Taskform.find(params[:taskform_id])
    @accept = @taskform.accepts.all
    render 'youanswers/new'
  end

  def show
    @taskform = Taskform.find(params[:taskform_id])
    @accept = @taskform.accepts.find(params[:id])
  end

  def new
    @taskform = Taskform.find(params[:taskform_id])
    @accept = @taskform.accepts.new
  end

  def edit
    @taskform = Taskform.find(params[:taskform_id])
    @accept = @taskform.accepts.find(params[:id])
  end

  def create
    @taskform = Taskform.find(params[:taskform_id])
    @accept = @taskform.accepts.create(accept_params)
    render 'youanswers/new'
  end

    def update
      @taskform = Taskform.find(params[:taskform_id])
      @accept = @taskform.accepts.find(params[:id])

    if @accept.update(accept_params)
      redirect_to '/taskforms/'
    else
      render 'edit'
    end
    end

    def destroy
      @taskform = Taskform.find(params[:taskform_id])
      @accept = @taskform.accepts.find(params[:id])
      @accept.destroy
      redirect_to '/taskform/'
    end

    private
      def accept_params
        params.require(:accept).permit(:userid, :stoptime, :counttrue, :totaltime, :issuesall, :numberrand)
      end
end
