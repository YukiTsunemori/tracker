class WorkspacesController < ApplicationController
  def index
    if current_user
      user_id = session[:user_id]
      # binding.irb
      @workspaces = Workspace.joins(:user).select("users.name as creator, workspaces.name").where(user_id: user_id)
      # binding.irb
    else
      
    end
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

  def update

  end

  private
    def workspace_params
      params.require(:workspace).permit(:name)
    end
end
