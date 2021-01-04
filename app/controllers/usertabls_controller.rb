class UsertablsController < ApplicationController
  before_action :authenticate_user!
  before_action :topic_find
  before_action :usertabl_find, only: [:show, :edit, :update, :destroy]
  after_action :add_id, only: [:edit]

  def index
    @usertabl = @topic.usertabls.all
  end

  def show
    redirect_to '/topics/'
  end

  def new
    @usertabl = @topic.usertabls.new
  end

  def edit
  end

  def create
    @usertabl = @topic.usertabls.create(usertabl_params)
    render '/usertabls/edit'
  end

  def update
    if @usertabl.update(usertabl_params)
      render '/usertabls/edit'
    else
      render 'edit'
    end
  end

  def destroy
    @usertabl.destroy
    redirect_to '/topics/'
  end

  private

  def topic_find
    @topic = Topic.find(params[:topic_id])
  end

  def usertabl_find
    @usertabl = @topic.usertabls.find(params[:id])
  end

  def add_id
    if @usertabl.addcontact
      user = @usertabl
      user.update(addcontact: "")
      Contact.create(idvisitor: user.userid, idcreator: current_user.id, codecreator: current_user.encrypted_password)
    end
  end

  def usertabl_params
    params.require(:usertabl).permit(:userid, :addcontact)
  end
end
