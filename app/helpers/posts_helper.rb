module PostsHelper
  def reply_msg_exist?(post_id)
    # binding.irb
    @reply_msg = ReplyMessage.where(post_id: post_id)
  end

  def current_workspace
    
  end

  
end
