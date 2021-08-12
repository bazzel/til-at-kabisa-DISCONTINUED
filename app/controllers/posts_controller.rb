# frozen_string_literal: true

class PostsController < ApplicationController
  include JsonapiRailsHooks

  before_action :set_post, only: %i[ show ]
  before_action :set_channel, only: %i[ index show ]

  # GET /posts or /posts.json
  def index
    @posts = Post.includes(:author, channel: [:posts]).order(created_at: :desc)
    @posts = @posts.where(channel: @channel) if params[:channel_id]
    @posts = @posts.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render jsonapi: @posts }
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render jsonapi: @post }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by(id: params[:id]) || Post.all.sample
    end

    def set_channel
      @channel = Channel.find_by(slug: params[:channel_id])
    end
end
