class PostsController < ApplicationController

  before_action :set_article, only: [:new, :create, :index, :show]

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
   if params[:title].present? and params[:body].present?
    img = params[:image].present? ? upload_image_on_cloud(params[:image],"Image") : ''
    p img
     @post = Post.create(
      title:params[:title],
      body:params[:body],
      image:params[:image],)
     flash[:success] = "successfull"
      redirect_to  root_path
    end
    
  end

  def upload_image_on_cloud img_url,folder_name
    m = Cloudinary::Uploader.upload(img_url, :quality=>80,:folder => "/#{folder_name}/")
    url =m["url"]
  end


  def edit
  @post = Post.find_by_id(params[:id]) 
  p @post
 end 


def update

   @post = Post.find_by_id(params[:id])
  p @post
  p"======================="
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


    def set_article

       if current_user.present?
        @post = Post.all
       else
        redirect_to new_user_session_path
      end
    end

end