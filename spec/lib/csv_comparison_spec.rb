require 'rails_helper'
require 'csv_comparison'

RSpec.describe 'CsvComparison' do

  describe '.import' do
    let(:csv_one) { File.new(fixture_path + '/csv_one.csv') }
    let(:csv_two) { File.new(fixture_path + '/csv_two.csv') }

    context 'when no concerns provided (show all discrepancies)' do
      it 'should output all discrepancies between the two CSV files' do
        account_discrepancies = CsvComparison.new.import(csv_one, csv_two, 'both')
        expect(account_discrepancies).to eq(['test_1@gmail.com', 'test_2@gmail.com'])
      end
    end

    context 'when subscriber_count concerns are requested' do
      it 'should output subscriber count discrepancies between the two CSV files' do
        account_discrepancies = CsvComparison.new.import(csv_one, csv_two, 'subscriber_count')
        expect(account_discrepancies).to eq(['test_1@gmail.com'])
      end
    end

    context 'when channel_ownership concerns are requested' do
      it 'should output channel ownership discrepancies between the two CSV files' do
        account_discrepancies = CsvComparison.new.import(csv_one, csv_two, 'channel_ownership')
        expect(account_discrepancies).to eq(['test_2@gmail.com'])
      end
    end
  end
end
