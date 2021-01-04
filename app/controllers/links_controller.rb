class LinksController < ApplicationController
  before_action :authenticate_username!
  before_action :linktask_user
  before_action :linktask_update_user
  after_action :linktask_view

  def index
    useridname = current_username.id
    time_last = Time.now - 604800
    @links = Linktask.where(userid: useridname, created_at: time_last..Time.now).order(created_at: :desc).page(params[:page])
  end

  private

  def linktask_user
    $linktask_user = Redis.new
  end

  def linktask_update_user
    pass = current_username.encrypted_password
    user = pass + "link"
    $linktask_user.set(user, "0")
    $linktask_user.expire(user, 172800)
  end

  def linktask_view
    @links.each do |linktask|
      linktask.update(viewlinks: "y")
    end
  end

end
