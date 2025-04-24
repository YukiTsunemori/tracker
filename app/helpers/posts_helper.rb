module PostsHelper
  def reply_msg_exist?(post_id)
    # binding.irb
    @reply_msg = ReplyMessage.where(post_id: post_id)
    # binding.irb
  end

  def reply_msg_persisted?
    # new_record?=>trueとなるところをfalseにしたい
    # @reply_msg 
  end
end
