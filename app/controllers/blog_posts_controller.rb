class BlogPostsController < ApplicationController
  def index
    @posts = BlogPost.all
    #render "index.html.erb"
  end

  def show
    @post = BlogPost.find(params[:id])
    #render "show.html.erb"
  end

  def new
    @post = BlogPost.new
    #render "new.html.erb"
  end

  def create
    @post = BlogPost.new(blog_post_params)

    if @post.save
      redirect_to @post
    else
      render action: :new
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
    {blog_post:{
        title: 'C#',
        content: 'Its pointy'
    }}
    params
      .require(:blog_post)
      .permit([:title, :content])
  end
end
