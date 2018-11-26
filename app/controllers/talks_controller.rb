class TalksController < ApplicationController

  def create
    @room = Room.find_by(user_id: params[:user_id])

    @talk = current_user.talks.new(talks_params)
    @talk.room_id = @room.id

    @talk.save
    redirect_to user_path(params[:user_id])
  end

  def destroy
    talk =  Talk.find(params[:id])
    room = Room.find(talk.room_id)
    talk.destroy
    redirect_to user_path(room.user_id)
  end
private
  def talks_params
  	params.require(:talk).permit(:content)
  end

end

