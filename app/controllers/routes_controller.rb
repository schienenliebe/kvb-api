class RoutesController < ApplicationController
  respond_to :html, :json, :txt

  def index
    @routes = agency.routes.all
    respond_with @routes do |format|
      format.txt { render_gtfs(@routes, Route) }
    end
  end

  private

  def agency
    @agency ||= Agency.find(params[:agency_id])
  end
end