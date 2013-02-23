class StopTimesController < ApplicationController
  respond_to :html, :json, :txt

  def index
    stops = agency.stops.all
    @stop_times = stops.map { |stop| StopTime.new(stop.id) }
    respond_with @stops do |format|
      format.txt { render_gtfs(@stop_times, StopTime) }
    end
  end

  private

  def agency
    @agency ||= Agency.find(params[:agency_id])
  end

end