# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @start_at = start_date
    @end_at = end_date
    @q = params[:q] || ''

    @time_tracks = results

    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  private

  def results
    TimeTrack
      .between(@start_at..@end_at)
      .where('description LIKE ?', "%#{@q}%")
      .all
  end

  def start_date
    params[:start_at] && Time.zone.parse(params[:start_at]).utc ||
      params[:end_at] && (Time.zone.parse(params[:end_at]) - 1.month).utc ||
      Time.zone.now.beginning_of_month.utc
  end

  def end_date
    params[:end_at] && Time.zone.parse(params[:end_at]).utc ||
      params[:start_at] && (Time.zone.parse(params[:start_at]) + 1.month).utc ||
      Time.zone.now.end_of_month.utc
  end
end
