class RoomsController < ApplicationController
  before_action :authenticate_user!
  def new
  @room = Room.new
  end


  def create
    @room = Room.new(room_params)
    @room.save
    redirect_to room_messages_path(@room)
  end

  def show
    # もしチャットルームがなかったら、新規ルームを作成する
    current_user_room_ids = RoomUser.where(user_id: current_user).ids
    partner_room_ids = RoomUser.where(user_id: params[:id]).ids
    room_id = (current_user_room_ids && partner_room_ids).first

    if room_id.present?
      @room = Room.find(room_id)
    else
      partner = User.find(params[:id])
      @room = Room.create(nickname: partner.nickname)
      RoomUser.create(room_id: @room.id, user_id: current_user.id)
      RoomUser.create(room_id: @room.id, user_id: params[:id])
    end
  end

private

  def room_params
  params.permit(user_ids: [])
  end

end