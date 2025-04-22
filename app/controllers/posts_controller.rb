class PostsController < ApplicationController

  def index
    workspace_id
    @posts = Post.where(workspace_id: workspace_id)
    
  end

  def edit
    @post = Post.where(params[:id])
    # binding.irb
    # firstがないと複数のモデルオブジェクトを返すため受け取る側のhtmlでエラーとなる。
    # firstにすることでオブジェクトを１件のみ返す。
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Changes have been completed"
      redirect_to posts_path  # ← 適宜リダイレクト先を調整
    else
      render :edit, status: :unprocessable_entity
    end
  end
  

  def new
  end

  private

    def post_params
      params.require(:post).permit(:title_name, :parent_content)
    end

end
