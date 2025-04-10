module SessionsHelper

  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  # 永続的セッションのためにユーザーをデータベースに記憶する
  def remember(user)
    user.remember
    binding.irb
    # ユーザーIDを取得し有効期限と暗号化を行いcookiesへ保存する
    cookies.permanent.encrypted[:user_id] = user.id
    # ユーザーのrememberトークンを取得しcookiesのremember_token属性へ保存する
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    if session[:user_id]
      # => @current_user = @current_user || User.find_by(id: session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
      # binding.irb
    end
  end
  # binding.irb
  def logged_in?
    !current_user.nil?  
    # ユーザーがログインしていればTrue,ERB内で呼び出す！！
    # current_userを呼び出してもいいが、ロジックはこちらにまとめると呼び出すだけで済む。
    # またコードが複雑化しない。
  end

  def log_out
    reset_session
    @current_user = nil
  end

end
