class TransactionsController < ApplicationController
  def index
    start_date = permitted_params[:start_date].to_date.beginning_of_day
    end_date = permitted_params[:end_date].to_date.end_of_day

    @transactions = Transaction.by_user.where(due_date: start_date..end_date)
    @total_spent = @transactions.total_spent
    @total_paid = @transactions.total_paid

    render :index
  end

  private

  def permitted_params
    params.permit(:start_date, :end_date)
  end
end
