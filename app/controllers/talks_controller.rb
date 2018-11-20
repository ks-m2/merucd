class TalksController < ApplicationController
  def update
  	@talk = Talk.new(tatsuki_special)
  	@talk.user_id = current_user.id
  	@room = Room.find_by(user_id:params[:id])
  	@talk.room_id = @room.id
  	@talk.save
    redirect_to user_path(current_user)
  end

  def destroy
    talk =  Talk.find(params[:id])
    talk.destroy
    redirect_to user_path(current_user)
  end
private
def tatsuki_special
	params.require(:talk).permit(:content)
end
end

