class RoomsController < ApplicationController
  before_action :authenticate_user!
  def new
  @room = Room.new
  end

  def index
    @rooms = Room.myrooms(current_user)
  end


  def create
    @room = Room.new(room_params)
    @room.save
    redirect_to room_messages_path(@room)
  end

  def create_myroom
    #byebug
    @room = Room.myroom(current_user, params[:user_id])
    if @room.nil?
      @room = Room.create!(owner_id: current_user.id, user_id: params[:user_id])
    end
    redirect_to @room
  end

  def show
    @room = Room.find(params[:id])
    @user = @room.room_partner(current_user)
    @message = current_user.messages.build
    @messages = @room.messages
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

private

  def room_params
  params.permit(user_ids: [])
  end

end