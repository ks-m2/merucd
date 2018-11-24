class TalksController < ApplicationController
  before_action :room_user, only:[:create]
  def create
    @user = User.find(current_user.id)
    @room = Room.find(params[:user_id])

    @talk = current_user.talks.new(talks_params)
    @talk.user_id = @user.id
    @talk.room_id = @room.id

    @talk.save
    redirect_to user_path(@room.id)
  end

  def destroy
    talk =  Talk.find(params[:id])
    talk.destroy
    redirect_to user_path(current_user)
  end
private
  def talks_params
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

