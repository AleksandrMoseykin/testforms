class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :topic_find, only: [:show, :view, :edit, :update, :destroy]
  after_action :statistica_creator, only: [:create, :update, :destroy]
  after_action :topic_id_link_delete, only: [:destroy]

  def index
    user = current_user.encrypted_password
    @topics = Topic.where(codecreator: user).order(id: :desc).page(params[:page])
  end

  def show
  end

  def view
  end

  def new
    @topic = Topic.new
    $compare_password = Redis.new
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to '/topics/'
    else
      render 'new'
    end
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def topic_find
    @topic = Topic.find(params[:id])
  end

  def topic_id_link_delete
    @linktask = Linktask.all
    @linktask.each do |link|
      unless Topic.find_by(id: link.topicid)
        link.destroy
      end
    end
  end

  def statistica_creator
    userencrypted = current_user.encrypted_password
    all_test_array = ["all_test_tesk", "all_test_tesk_activ", "all_test_tesk_stop"]
    all_test_array.each do |all_test_array|
      if $all_task_creat
        if $all_task_creat.get userencrypted + all_test_array
          $all_task_creat.del userencrypted + all_test_array
        end
      end
    end
  end

  def topic_params
      params.require(:topic).permit(:titletopic, :idreg, :codecreator, :countquestions, :sucquest, :timetask, :password, :ip, :email, :successmessage, :typetopic, :activ, :failuremessage, :intdate1, :intdate2, :rand)
  end
end
