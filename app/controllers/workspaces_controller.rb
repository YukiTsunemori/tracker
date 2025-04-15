class WorkspacesController < ApplicationController
  def index
    
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(name_params)
    if @workspace.save
      flash[:success] = "Created new Workspace!"
      redirect_to 'index'
    else
      render "new", status: :unprocessable_entity
    end
  end

  def update

  end

  private
    def name_params
      params.require(:workspace).permit(:name)
    end
end
