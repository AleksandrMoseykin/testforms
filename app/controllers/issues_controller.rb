class IssuesController < ApplicationController
  def index
    @taskform = Taskform.find(params[:taskform_id])
    @issue = @taskform.issues.all
  end
    def show
      @taskform = Taskform.find(params[:taskform_id])
      @issue = @taskform.issues.find(params[:id])
    end

    def new
      @taskform = Taskform.find(params[:taskform_id])
      @issue = @taskform.issues.new
    end

    def edit
      @taskform = Taskform.find(params[:taskform_id])
      @issue = @taskform.issues.find(params[:id])
    end

    def create
        @taskform = Taskform.find(params[:taskform_id])
        @issue = @taskform.issues.create(issue_params)

        if @issue.save
          redirect_to '/taskforms/'
        else
          render 'new'
        end
      end

    def update
      @taskform = Taskform.find(params[:taskform_id])
      @issue = @taskform.issues.find(params[:id])

    if @issue.update(issue_params)
      redirect_to '/taskforms/'
    else
      render 'edit'
    end
    end

    def destroy
      @taskform = Taskform.find(params[:taskform_id])
      @issue = @taskform.issues.find(params[:id])
      @issue.destroy
      redirect_to '/taskforms/'
    end

    private
      def issue_params
        params.require(:issue).permit(:title, :img, :idreg)
      end
end
