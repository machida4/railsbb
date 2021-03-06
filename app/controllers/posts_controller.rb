class PostsController < ApplicationController
  def create
    post = Post.new(post_params)
    post.user_id = 1
    if post.save!
      redirect_to topic_path(post.topic.id), notice: '書き込みに成功しました'
    else
      render topic_path(post.topic.id)
    end
  end

  private

    def post_params
      params.require(:post).permit(:message, :topic_id, :image)
    end
end
