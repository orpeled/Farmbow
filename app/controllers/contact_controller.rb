class ContactController < ApplicationController

  def new
    @message = ContactMessage.new
  end

  def create
    @message = ContactMessage.new(params[:contact_message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Message was successfully sent.")
    else
      @message.errors
      render :new
    end

    end
  end