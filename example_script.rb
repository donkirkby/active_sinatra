require 'sinatra'
require 'sinatra/activerecord'

module MyWarningFilter
  def warn(message, category: nil, **kwargs)
    if /does not support composite primary key/.match?(message)
      # ignore
    else
      super
    end
  end
end
Warning.extend MyWarningFilter

Dir.glob('./{models,controllers}/*.rb').each { |file| require file }

puts "Loading extractions..."
n = LabExtraction.count
puts "Found #{n.inspect}."

enum = 'E1151439'
puts "Looking for #{enum}..."
old_extraction = LabExtraction.find_by_enum(enum)
if old_extraction.nil?
    puts "Not found."
else
    puts "Deleting #{enum}..."
    old_extraction.destroy!
end

puts "Creating #{enum}:"
extraction = LabExtraction.create!(
            enum: enum,
            samptype: 'PLASMA',
            procdate: '2024-07-30',
            postion: 'C1',
            block_num: 'DK12',
            entered_by: 'dkirkby')

puts "Created for enum #{extraction.enum.inspect}."

exit(0)
