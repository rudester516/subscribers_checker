require 'csv_comparison'

class HomeController < ApplicationController
  def index
  end

  def process_csvs
    @account_discrepancies = CsvComparison.new.import(params[:file_one], params[:file_two], params[:concerns])
  end
end
