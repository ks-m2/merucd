class MailsController < ApplicationController
  def new
  	@mail = Mail.new
  end

  def create
  	@mail = Mail.new(email_params)
  	@mail.user_id = current_user.id

  	if @mail.save
  		flash[:notice] = "送信完了しました"
  		redirect_to products_path
  	else
  		@mail.errors.full_messages
  		render "mails/new"
  	end
  end


  private
  def email_params
  	params.require(:mail).permit(:name, :email, :subject, :content)
  end

end
