class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @creator = Creator.find_by(idreg: current_user.id)
    $creator = Redis.new
  end
end
