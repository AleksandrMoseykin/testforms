class ProfilevisitorController < ApplicationController
  before_action :authenticate_username!
  
  def index
    @visitor = Visitor.find_by(idregvis: current_username.id)
    $visitor_name = Redis.new
  end
end
