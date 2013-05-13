class ContactController < ApplicationController

  def new
    @message = ContactMessage.new
  end

  def create
    @message = ContactMessage.new(params[:contact_message])

    #if(!params[:contact_message]['contact_image'].nil?)
    #  @message.update_attributes(params[:contact_message])
    #end


    if @message.valid? and @message.save
      #if @message.save
        unless current_user.nil?
          current_user.create_activity key: 'contact.create'
        end
        NotificationsMailer.new_message(@message).deliver
        redirect_to(root_path, :notice => "Message was successfully sent.")
      else
        @message.errors
        render :new
      #end
    end

  end
end