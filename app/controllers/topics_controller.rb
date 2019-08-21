class TopicsController < ApplicationController
  def index
    @topics = Topic.all.order(id: "DESC").page(params[:page])
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    @newpost = Post.new(topic_id: params[:id])
  end

  def new
  end

  def create
    topic = Topic.new(topic_title)
    if topic.save
      redirect_to topic_path(topic), notice: "スレッドを立てました"
    else
      render :new
    end
  end

  private

    def topic_title
      params.require(:topic).permit(:title)
    end
end
