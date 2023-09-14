class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end
end
