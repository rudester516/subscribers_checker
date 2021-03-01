require 'csv'

class CsvComparison

  def import(file_one, file_two, concerns)
    parsed_one = CSV.parse(File.read(file_one), headers: true)
    parsed_two = CSV.parse(File.read(file_two), headers: true)
    account_discrepancies = []
    parsed_one.each_with_index do |row, index|
      subscriber_one = row[" YouTube Channel"].split('/').last.gsub(/^UC/, '')
      subscriber_two = parsed_two[index][" YouTube Channel"].split('/').last.gsub(/^UC/, '')

      if !subscriber_one.eql?(subscriber_two) && (["both", "channel_ownership"].include? concerns)
        account_discrepancies << row["Account Email"]
      end

      if (row[" Subscriber Count"].to_i != parsed_two[index][" Subscriber Count"].to_i) && (["both", "subscriber_count"].include? concerns)
        account_discrepancies << row["Account Email"]
      end
    end
    account_discrepancies.uniq
  end
end
