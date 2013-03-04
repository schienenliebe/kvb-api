class StopsController < ApplicationController
  respond_to :html, :json, :txt

  layout 'agency'

  def index
    @stops = agency.stops.all
    respond_with @stops do |format|
      format.txt { render_gtfs(@stops, Stop) }
    end
  end

  private

  def agency
    @agency ||= Agency.find(params[:agency_id])
  end

end
