class WorkspacesController < ApplicationController
  def index
    if current_user
      user_id = session[:user_id]
      # binding.irb
      @workspaces = Workspace.joins(:user).select("users.name as creator, workspaces.name, workspaces.id").where(user_id: user_id)
     
    end
  end

  def show
    # binding.irb
    @post = Post.where(workspace_id: params[:id])
    @new_post = Post.new
    # binding.irb
    @new_post.workspace_id = params[:id]
    # binding.irb
  end

  def new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user_id = current_user.id
    # binding.irb
    if @workspace.save
      participant = Participant.new()
      # binding.irb
      participant.workspace_id = @workspace.id
      participant.user_id = current_user.id
      participant.save
      flash[:success] = "Created new Workspace!"
      # binding.irb
      redirect_to '/index'
    else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    # binding.irb
    Workspace.find(params[:id]).destroy

    flash[:success] = "Workspace deleted"
    redirect_to index_path

  end

  private
    def workspace_params
      params.require(:workspace).permit(:name)
    end

  
end
