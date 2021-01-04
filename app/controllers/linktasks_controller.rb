class LinktasksController < ApplicationController
  before_action :authenticate_user!
  before_action :linktask_find, only: [:show, :edit, :update, :destroy]
  before_action :linktask_user
  after_action :linktask_update_user, only: [:create]

  def index
    @linktasks  = Linktask.all
  end

  def show
  end

  def new
    @linktasks  = Linktask.all
    @linktask = Linktask.new
  end

  def edit
  end

  def create
    @linktask = Linktask.new(link_params)

    if @linktask.save
      redirect_to '/topics/'
    else
      render 'new'
    end
  end

  def update
    if @linktask.update(link_params)
      redirect_to @linktask
    else
      render 'edit'
    end
  end

  def destroy
    @linktask.destroy
    redirect_to '/topics/'
  end

    private

    def linktask_find
      @linktask = Linktask.find(params[:id])
    end

    def linktask_user
      $linktask_user = Redis.new
    end

    def linktask_update_user
      last_linktask = Linktask.where(idcreator: current_user.id).last
      userid = last_linktask.userid
      pass = Username.find_by(id: userid).encrypted_password
      user = pass + "link"
      value_link = $linktask_user.get(user)
      value_link = value_link.to_i + 1
      $linktask_user.set(user, value_link)
      $linktask_user.expire(user, 172800)
    end

    def link_params
        params.require(:linktask).permit(:link, :idcreator, :codecreator, :topicid, :userid, :viewlinks)
    end
  end
