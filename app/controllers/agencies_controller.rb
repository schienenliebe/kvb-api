require 'csv'

class AgenciesController < ApplicationController
  respond_to :html, :json

  def index
    @agencies = Agency.all
    respond_with @agencies
  end

  def show
    @agency = Agency.find(params[:id])
    respond_with @agency do |format|
      format.html { render layout: 'agency' }
    end
  end

  def gtfs
    @agency = Agency.find(params[:agency_id])
    render_single_gtfs_record(@agency)
  end

end