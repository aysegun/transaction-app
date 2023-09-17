class TransactionsController < ApplicationController
  # before_action :set_client

  # def index
  #   @transactions = @client.transactions
  # end

  def show
    @transaction = @client.expenses.find(params[:id])
  end

  def new
    @expense = Expense.new
    @payment = Payment.new
    # @transaction.client_id = params[:client_id]
  end

  def create
    ActiveRecord::Base.transaction do
      client = Client.find(transaction_params[:client_id])

      expense = Expense.create(
        description: transaction_params[:expense_description],
        amount: transaction_params[:expense_amount],
        client: client
      )

      # payment = Payment.create(
      #   amount: transaction_params[:payment_amount],
      #   client: client
      # )

      if expense.persisted? && payment.persisted?
        redirect_to root_path, notice: 'Transaction was successfully created.'
      else
        raise ActiveRecord::Rollback
      end
    end

  rescue ActiveRecord::RecordInvalid => e
    flash.now[:error] = e.message
    render :new
  end

  private

  # def set_client
  #   @client = Client.find(params[:client_id])
  # end

  def transaction_params
    params.require(:transaction).permit(:description, :amount)
  end
end
