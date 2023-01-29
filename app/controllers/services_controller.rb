class ServicesController < ApplicationController
  before_action :setup_service, only: %i[new destroy create]

  def new; end

  def destroy; end

  private

  def setup_service
    @invoice = Invoice.new(services: [Service.new])
  end
end
