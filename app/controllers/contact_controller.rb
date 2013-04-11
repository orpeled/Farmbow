class ContactController < ApplicationController

  def new
    @message = ContactMessage.new
  end

  def create
    @message = ContactMessage.new(params[:contact_message])
      #NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Message was successfully sent.")
      #render :new
    end
  end