class ServicesController < ApplicationController
  def destroy
    @invoice = Invoice.new(services: [Service.new])
  end
end
