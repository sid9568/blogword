class CommentsController < ApplicationController

def show
    @post = Post.find_by_id(params[:id])
end

def new
  @post = Post.find_by_id(params[:id])
end

def create
    @post = Post.find_by_id(params[:id])
    p"----------------------------------"
    p @post
    @comment = @post.comments.create!(email:params[:email],comment:params[:comment])
    redirect_to root_path
  end
  def navbar
  end
    
  end

  def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:email, :comment)
    end

  

end
