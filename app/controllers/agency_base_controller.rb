class AgencyBaseController < ApplicationController
  respond_to :html, :json, :txt

  layout 'agency'

  private

  def agency
    @agency ||= Agency.find(params[:agency_id])
  end
end