class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    if params[:search]
      @pets = Pet.search(params[:search])
    end
  end

  def index
    @applications = Application.all
    @pet_applications = PetApplication.all
  end

  def new
  end

  def create
    application = Application.new(application_params)

    if application.save
      redirect_to "/applications/#{application.id}"
    else
      redirect_to '/applications/new'
      flash[:alert] = "Error: #{error_message(application.errors)}"
    end
  end

  def update
    application = Application.find(params[:id])
      application.update(application_params)
      redirect_to "/applications/#{application.id}"
  end

  private
  def application_params
    params.permit(:name, :street_address, :city, :state, :zipcode, :cover_letter, :status)
  end
end
