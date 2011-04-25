# encoding: UTF-8
class MessagesController < ApplicationController
  
  before_filter :correct_profile
  before_filter :set_user
  
  def index
    if params[:mailbox] == "sent"
      @messages = @profile.sent_messages
    else
      @messages = @profile.received_messages
    end
  end
  
  def show
    @message = Message.read(params[:id], current_profile)
  end
  
  def new
    @message = Message.new

    if params[:reply_to]
      @reply_to = @profile.received_messages.find(params[:reply_to])
      unless @reply_to.nil?
        @message.to = @reply_to.sender.email
        @message.subject = "Re: #{@reply_to.subject}"
        @message.body = "\n\n*Mensagem Original*\n\n #{@reply_to.body}"
      end
    end
  end
  
  def create
    @message = Message.new(params[:message])
    @message.sender = @profile
    @message.recipient = Profile.find_by_email(params[:message][:to])

    if @message.save
      flash[:notice] = "Mensagem Enviada"
      redirect_to profile_messages_path(@profile)
    else
      render :action => :new
    end
  end
  
  def delete_selected
    if request.post?
      if params[:delete]
        params[:delete].each { |id|
          @message = Message.find(:first, :conditions => ["messages.id = ? AND (sender_id = ? OR recipient_id = ?)", id, @profile, @profile])
          @message.mark_deleted(@profile) unless @message.nil?
        }
        flash[:notice] = "Mensagens deletadas com sucesso"
      end
     # redirect_to profile_message_path(@profile, @messages)
     redirect_to  profile_messages_path(current_profile)
    end
  end
  
 
     def correct_profile
      @profile = Profile.find(params[:profile_id])
      redirect_to profile_messages_path(current_profile) unless current_profile?(@profile)
    end
  
  private
    def set_user
      @profile = Profile.find(params[:profile_id])
    end
end