class TransactionsController < ApplicationController
  before_action :set_client

  def index
    @transactions = @client.transactions
  end

  def show
    @transaction = @client.transactions.find(params[:id])
  end

  def new
    @transaction = @client.tansaction.build
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end
end
