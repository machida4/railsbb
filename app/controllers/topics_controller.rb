class TopicsController < ApplicationController
  def index
    @topics = Topic.all.order(id: "DESC").page(params[:page])
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.page(params[:page]).per(100)
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
