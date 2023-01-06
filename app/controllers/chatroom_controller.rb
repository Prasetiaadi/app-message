class ChatroomController < ApplicationController

  def index

    @messages = Message.all
    # @messages = Message.custom_display
  end
end
