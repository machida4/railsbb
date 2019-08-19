class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @newpost = Post.new(topic_id: params[:id])
  end

  def new
  end

  def create
    topic = Topic.new(topic_title)
    if topic.save
      redirect_to topics_path, notice: "スレッドを立てました"
    else
      render :new
    end
  end

  private

    def topic_title
      params.require(:topic).permit(:title)
    end
end
