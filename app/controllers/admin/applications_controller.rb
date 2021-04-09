class Admin::ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def update
    application = Application.find(params[:id])
      if params[:commit] == "Approve"
          application.update(application_params.merge!(status: "Approved"))
      elsif params[:commit] == "Reject"
        application.update(application_params.merge!(status: "Rejected"))
      end
    redirect_to "/admin/applications/#{application.id}"
  end

  private
  def application_params
    params.permit(:name, :street_address, :city, :state, :zipcode, :cover_letter, :status)
  end
end
