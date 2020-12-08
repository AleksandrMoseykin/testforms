class YouanswersController < ApplicationController
  def index
    @taskform = Taskform.find(params[:taskform_id])
    @youanswer = @taskform.youanswers.all
  end
    def show
      @taskform = Taskform.find(params[:taskform_id])
      @youanswer = @taskform.youanswers.find(params[:id])
    end

    def new
      @taskform = Taskform.find(params[:taskform_id])
      @youanswer = @taskform.youanswers.new
    end

    def edit
      @taskform = Taskform.find(params[:taskform_id])
      @youanswer = @taskform.youanswers.find(params[:id])
    end

    def create
        @taskform = Taskform.find(params[:taskform_id])
        @youanswer = @taskform.youanswers.create(youanswer_params)
        render 'new'

    end

    def update
      @taskform = Taskform.find(params[:taskform_id])
      @youanswer = @taskform.youansweres.find(params[:id])

    if @youanswer.update(youanswer_params)
      redirect_to '/taskforms/'
    else
      render 'edit'
    end
    end

    def destroy
      @taskform = Taskform.find(params[:taskform_id])
      @youanswer = @taskform.youanswers.find(params[:id])
      @youanswer.destroy
      redirect_to '/taskforms/'
    end

    private
      def youanswer_params
        params.require(:youanswer).permit(:answeruser, :scoreanswer, :issueid, :userid, :usercode)
      end
end
