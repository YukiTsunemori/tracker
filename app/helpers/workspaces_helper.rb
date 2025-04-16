module WorkspacesHelper

  def current_user_id
  current_user.id
  end

  def exist?
    @workspace_exist ||= Workspace.where(user_id: current_user_id)
    return @workspace_exist.exists?
    # exists?メソッドはSQLが発行されるため、空の配列オブジェクトを返す場合にのみ使える。
    # シンプルな空の配列にはexists?メソッドは使えない（SQL文ではない）のでメソッドエラーとなる。
  end


end
