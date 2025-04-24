class PostsController < ApplicationController
  
  def index
    workspace_id
    @posts = Post.where(workspace_id: workspace_id)
    
  end

  def edit
    @post = Post.find(params[:id])
    post_id = @post.id
    reply_msg_exist?(post_id)
    # binding.irb
    @reply_msgs = ReplyMessage.new
    
    # binding.irb
    # firstがないと複数のモデルオブジェクトを返すため受け取る側のhtmlでエラーとなる。
    # firstにすることでオブジェクトを１件のみ返す。
  end

  def update
    @post = Post.find(params[:id])
    # binding.irb
    if @post.update(post_params)
      flash[:success] = "Changes have been saved successfully"
      redirect_to workspace_path(@post.workspace_id)  # ← workspaces/:idにリダイレクト
      # resolveのboolean型はparams[:post][:resolve]で取得できる
      
    else
      render :edit, status: :unprocessable_entity
    end
  end
  

  def new
  end

  private

    def post_params
      params.require(:post).permit(:title_name, :parent_content, :resolve)
    end

end
