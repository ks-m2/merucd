class TalksController < ApplicationController
  before_action :room_user, only:[:update]
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
  def room_user
      if Room.where(user_id: current_user.id).exists?
      else
        @room = Room.new(user_id: current_user.id)
        @room.save
      end
  end
end

