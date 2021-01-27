# frozen_string_literal: true

class ReportController < ApplicationController
  def index
    @date = params[:date] && Time.zone.parse(params[:date]) || Time.zone.now
    start_date = @date.beginning_of_month.utc
    end_date = @date.end_of_month.utc
    @time_tracks = TimeTrack.between(start_date..end_date).all
    respond_to do |format|
      format.html
      format.xlsx
    end
  end
end
