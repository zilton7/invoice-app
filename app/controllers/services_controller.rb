class ServicesController < ApplicationController
  before_action :set_service

  def new; end

  def destroy; end

  private

  def set_service
    @invoice = Invoice.new(services: [Service.new])
  end
end
