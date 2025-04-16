module WorkspacesHelper

  def exist?
    if user_id = session[:user_id]
      @workspace_exist = Workspace.where(user_id: user_id)
     else
      return false
    end
  end


end
