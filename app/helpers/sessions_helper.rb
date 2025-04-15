module SessionsHelper

  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
    # session[:session_token] = user.session_token
  end

  # 永続的セッションのためにユーザーをデータベースに記憶する
  def remember(user)
    user.remember
    # binding.irb
    # ユーザーIDを取得し有効期限と暗号化を行いcookiesへ保存する
    cookies.permanent.encrypted[:user_id] = user.id
    # ユーザーのrememberトークンを取得しcookiesのremember_token属性へ保存する
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.encrypted[:user_id])
      raise # テストがパスすれば、この部分がテストされいないことがわかる
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  # ユーザーIDをユーザーIDのセッションを代入した結果がTrueであれば、
  # IDを用いてUserオブジェクトをカレントユーザーへ代入。
  # そうでなければ、もし暗号化されたユーザーIDがCookiesへ代入しTrueとなれば、
  # そのIDを用いてuserへ代入。そのuserが有効なremember_tokenを持っていれば
  # cookiesへ保存し、ログインをさせる。そして、そのuserをカレントユーザーとする。


  # binding.irb
  def logged_in?
    return !current_user.nil?  
    # ユーザーがログインしていればTrue,ERB内で呼び出す！！
    # current_userを呼び出してもいいが、ロジックはこちらにまとめると呼び出すだけで済む。
    # またコードが複雑化しない。
  end

  # 永続的セッションを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

 # 現在のユーザーをログアウトする
  def log_out
    forget(current_user)
    reset_session
    @current_user = nil
  end

  def user_name
    @name = @current_user.name
  end

end
