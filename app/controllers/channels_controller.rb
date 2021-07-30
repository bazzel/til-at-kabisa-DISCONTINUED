# frozen_string_literal: true

class ChannelsController < ApplicationController
  before_action :set_channel, only: %i[ show ]

  # GET /channels/1 or /channels/1.json
  def show
    @posts = @channel.posts
    .order(created_at: :desc)
    .includes(:author, channel: [:posts])
    .page(params[:page])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find_by(slug: params[:id])
    end
end
