# frozen_string_literal: true

class ReportController < ApplicationController
  def index
    @date = params[:date] && Time.zone.parse(params[:date]).utc || Time.zone.now.beginning_of_month.utc
    @end_date = @date.end_of_month
    @time_tracks = TimeTrack.between(@date..@end_date).all
    respond_to do |format|
      format.html
      format.xlsx
    end
  end
end
