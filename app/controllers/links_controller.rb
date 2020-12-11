class LinksController < ApplicationController

  before_action :linktask_user
  before_action :linktask_update_user

  def index
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
end
