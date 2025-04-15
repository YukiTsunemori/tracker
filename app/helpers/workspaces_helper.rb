module WorkspacesHelper
  include SessionsHelper
  # binding.irb

  def current_workspace
    user_id = current_user.id
    @workspaces = Workspace.where(id: user_id) if current_user
  end


  def exist?
    return !@workspaces.nil?
  end
  # binding.irb
end
