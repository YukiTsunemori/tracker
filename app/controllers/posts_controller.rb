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
    @reply_msgs.post_id = post_id
    @new_post = Post.new
    # firstがないと複数のモデルオブジェクトを返すため受け取る側のhtmlでエラーとなる。
    # firstにすることでオブジェクトを１件のみ返す。
  end

  def create
    @new_post = Post.new(new_post_params)
    @new_post.user_id = current_user.id
    # binding.irb
    if @new_post.save
      flash[:success] = "Post have been created"
      redirect_to workspace_path(@new_post.workspace_id)
    else
      # post投稿が失敗した時の処理
    end

  end

  def update
    # binding.irb
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

  def destroy
    # binding.irb
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to workspace_path

  end

  private

    def post_params
      params.require(:post).permit(:title_name, :parent_content, :resolve)
    end

    def new_post_params
      params.require(:post).permit(:title_name, :parent_content, :workspace_id)
    end

end
