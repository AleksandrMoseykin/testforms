class UsertablsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @usertabl = @topic.usertabls.all
  end
    def show
      @topic = Topic.find(params[:topic_id])
      @usertabl = @topic.usertabls.find(params[:id])
    end

    def new
      @topic = Topic.find(params[:topic_id])
      @usertabl = @topic.usertabls.new
    end

    def edit
      @topic = Topic.find(params[:topic_id])
      @usertabl = @topic.usertabls.find(params[:id])
    end

    def create
        @topic = Topic.find(params[:topic_id])
        @usertabl = @topic.usertabls.create(usertabl_params)
        render '/usertabls/edit'
      end

    def update
      @topic = Topic.find(params[:topic_id])
      @usertabl = @topic.usertabls.find(params[:id])

    if @usertabl.update(usertabl_params)
      render '/usertabls/edit'
    else
      render 'edit'
    end
    end

    def destroy
      @topic = Topic.find(params[:topic_id])
      @usertabl = @topic.usertabls.find(params[:id])
      @usertabl.destroy
      redirect_to '/topics/'
    end

    private
      def usertabl_params
        params.require(:usertabl).permit(:userid, :addcontact)
      end
end
