module WorkspacesHelper

  def current_user_id
  current_user.id
  end

  def exist?
    @workspace_exist ||= Workspace.where(user_id: current_user_id)
    return @workspace_exist.exists?
  end


end
