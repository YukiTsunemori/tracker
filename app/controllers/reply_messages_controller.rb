class ReplyMessagesController < ApplicationController
  def create
    # binding.irb
    @message = ReplyMessage.new(reply_params)
    @message.user_id = session[:user_id]
    # binding.irb
    if @message.save
      # binding.irb
      flash[:success] = "Reply have been made"
      redirect_to edit_post_path(@message.post.id)
    else
      redirect_to root_url, status: :unprocessable_entity
      # binding.irb
    end
  end

  def destroy
    
  end

  private
  def reply_params
    params.require(:reply_message).permit(:id, :reply_content, :post_id)
  end
end
