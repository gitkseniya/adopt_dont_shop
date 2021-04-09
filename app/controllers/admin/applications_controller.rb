# frozen_string_literal: true

module Admin
  class ApplicationsController < ApplicationController
    def show
      @application = Application.find(params[:id])
    end

    def update
      application = Application.find(params[:id])
      case params[:commit]
      when 'Approve'
        application.update(application_params.merge!(status: 'Approved'))
      when 'Reject'
        application.update(application_params.merge!(status: 'Rejected'))
      end
      redirect_to "/admin/applications/#{application.id}"
    end

    private

    def application_params
      params.permit(:name, :street_address, :city, :state, :zipcode, :cover_letter, :status)
    end
  end
end
