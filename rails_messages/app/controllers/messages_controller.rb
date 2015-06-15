class MessagesController < ApplicationController
  def index
    key = "messages-#{Message.count}-#{Message.maximum(:updated_at)}"
    hit = Rails.cache.exist?(key)
    if hit
      render :json => Rails.cache.fetch(key)
    else
      messages = Message.all
      messages_json = []

      messages.each do |message|
        message_json = Rails.cache.fetch("message-#{message.id}-#{message.updated_at}") do
          message.to_json
        end

        messages_json << message_json
      end

      Rails.cache.write(key, messages_json)
      render :json => messages_json
    end
  end

  def show
    message = Message.find(params[:id])
    key = "message-#{message.id}-#{message.updated_at}"
    message_json = Rails.cache.fetch(key) do
      message.to_json
    end
    render :json=>message_json
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

  #def destroy
  #  message = Message.find(params[:id])
  #  if message.destroy
  #    Rails.cache.delete("message-#{message.id}")
  #  end
  #  
  #  render :json=>message.to_json
  #end

  #def show
  #  message = Message.find(params[:id])
  #  message_json = Rails.cache.fetch("message-#{message.id}") do
  #    message.to_json
  #  end
  #  
  #  render :json => message_json
  #end

  #def update
  #  message = Message.find(params[:id])
  #  if message.update_attributes(params[:message])
  #    message_json = message.to_json
  #    Rails.cache.delete("message-#{message.id}")

  #    Rails.cache.write("message-#{message.id}", message_json)
  #    render :json=>message_json
  #  else
  #    render :json=>message.errors
  #  end
  #end
end
