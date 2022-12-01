require 'csv'

namespace :db do
  namespace :import do
    task :load_csv_data, [:model_name, :filepath, :encoding] => :environment do |t, args|
      models = ["WorkOrder", "Technician", "Location"]
      encoding = args[:encoding].nil? ? "bom|utf-8" : args[:encoding]
      file = CSV.read(args[:filepath], :encoding => encoding)
      record = []

      file.drop(1).each do |row|
        record_data = {}
        row.each_with_index do |value, ind|
          record_data[file[0][ind].to_sym] = value
        end
        if args[:model_name] == "WorkOrder"
          record_data[:time] = DateTime.strptime(record_data[:time], "%D %R")
        end
        record.push(record_data)
      end

      if args[:model_name] == "WorkOrder"
        loc = WorkOrder.create(record)
      end

      if args[:model_name] == "Technician"
        loc = Technician.create(record)
      end

      if args[:model_name] == "Location"
        loc = Location.create(record)
      end

    end
  end
end
