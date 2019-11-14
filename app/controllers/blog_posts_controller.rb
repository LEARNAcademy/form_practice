class BlogPostsController < ApplicationController
  def index
    @posts = BlogPost.all
    #render "index.html.erb"
  end

  def show
    @post = BlogPost.find(params[:id])
    render json: @post
    #render "show.html.erb"
  end


  def create
    @post = BlogPost.new(blog_post_params)
    if @post.save
      render json: @post, status: 200
    else
      render json: @post.errors, status: 422
    end
  end

  def delete
    @post = BlogPost.find(params[:id])
    if @post.destroy
      redirect_to blog_posts_path
    else
      redirect_to blog_post_path(@post)
    end

  end

  private
  def blog_post_params
    params
      .require(:blog_post)
      .permit([:title, :content])
  end
end
