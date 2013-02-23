class StopsController < ApplicationController

  def index
    @stops = agency.stops.all
    respond_to do |format|
      format.html
      format.json { render :json => @stops }
    end
  end

  private

  def agency
    @agency ||= Agency.find(params[:agency_id])
  end

end
