class MessagesController < ApplicationController
  def index
    messages = Message.all
    render :json => messages
  end

  def create
    message = Message.new
    message.user = params[:user]
    message.body = params[:body]
    if message.save
      render :json => message
    else
      render :json => message.errors
    end
  end
end
