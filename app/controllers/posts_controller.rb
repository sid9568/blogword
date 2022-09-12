class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    
    img = params[:image].present? ? upload_image_on_cloud(params[:image],"Image") : ''
    p img
     @post = Post.create(
      title:params[:title],
      body:params[:body],
      image:params[:image],)
      redirect_to  root_path
    
  end

  def upload_image_on_cloud img_url,folder_name
    m = Cloudinary::Uploader.upload(img_url, :quality=>80,:folder => "/#{folder_name}/")
    url =m["url"]
  end


  def edit

  @post = Post.find_by_id(params[:id]) 

 end 

def update

   @post = Post.find_by(params[:id])

    if @post.update(
      title:params[:title],
      body:params[:body],
      image:params[:image],)
      
      redirect_to root_path
      else
      render :edit, status: :unprocessable_entity
    end
    
  end  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to  root_path

  end


  private
    def post_params
      params.require(:post).permit(:title, :body, :image)
    end
end