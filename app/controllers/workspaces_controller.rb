class WorkspacesController < ApplicationController
  
  def index
    if current_user
      @workspaces = Workspace.joins(:user).select("users.name as creator, workspaces.name")
      # binding.irb
    else
      
    end
  end

  def new
    # @workspace = Workspace.new
  end
  # binding.irb

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
