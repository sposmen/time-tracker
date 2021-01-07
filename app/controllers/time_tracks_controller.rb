class TimeTracksController < ApplicationController
  before_action :set_time_track, only: %i[show edit update destroy duplicate stop]
  before_action :stop_time, only: %i[start duplicate stop]

  # GET /time_tracks
  # GET /time_tracks.json
  def index
    @time_track = TimeTrack.new
    @date = params[:date] && Date.parse(params[:date]) || Date.today
    @time_tracks = TimeTrack.date(@date).all

    render partial: 'table' if params[:refresh]
  end

  def start
    TimeTrack.create(time_track_params.merge(start_at: @new_time))
    redirect_to time_tracks_url
  end

  def duplicate
    TimeTrack.create(@time_track.attributes.slice('description').merge(start_at: @new_time))
    redirect_to time_tracks_url
  end

  def stop
    redirect_to time_tracks_url
  end

  # GET /time_tracks/1
  # GET /time_tracks/1.json
  def show
  end

  # GET /time_tracks/new
  def new
    @time_track = TimeTrack.new
  end

  # GET /time_tracks/1/edit
  def edit
  end

  # POST /time_tracks
  # POST /time_tracks.json
  def create
    @time_track = TimeTrack.new(time_track_params)

    respond_to do |format|
      if @time_track.save
        format.html { redirect_to time_tracks_url, notice: 'Time track was successfully created.' }
        format.json { render :show, status: :created, location: @time_track }
      else
        format.html { render :new }
        format.json { render json: @time_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_tracks/1
  # PATCH/PUT /time_tracks/1.json
  def update
    respond_to do |format|
      if @time_track.update(time_track_params)
        format.html { redirect_to time_tracks_url, notice: 'Time track was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_track }
      else
        format.html { render :edit }
        format.json { render json: @time_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_tracks/1
  # DELETE /time_tracks/1.json
  def destroy
    @time_track.destroy
    respond_to do |format|
      format.html { redirect_to time_tracks_url, notice: 'Time track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_time_track
    @time_track = TimeTrack.find(params[:id] || params[:time_track_id])
  end

  # Only allow a list of trusted parameters through.
  def time_track_params
    params.require(:time_track).permit(:description, :start_at, :end_at)
  end

  def stop_time
    to_stop = TimeTrack.where(end_at: nil).count.positive?

    if to_stop
      @new_time = Time.current.ceil(5.minutes)
      TimeTrack.where(end_at: nil).update_all(end_at: @new_time)
    else
      @new_time = Time.current.floor(5.minutes)
    end
  end
end
