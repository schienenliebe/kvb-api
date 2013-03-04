class CalendarServicesController < AgencyBaseController

  def index
    @calendar_services = agency.calendar_services.all
    respond_with @calendar_services do |format|
      format.txt { render_gtfs(@calendar_services, CalendarService) }
    end
  end

end