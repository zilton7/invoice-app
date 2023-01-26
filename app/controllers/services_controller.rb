class ServicesController < ApplicationController
  before_action :set_service, only: :edit
  before_action :setup_service, only: %i[new destroy]

  def new; end

  def edit; end

  def destroy; end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def setup_service
    @invoice = Invoice.new(services: [Service.new])
  end
end
