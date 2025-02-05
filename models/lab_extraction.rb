class LabExtraction < ActiveRecord::Base
    self.table_name = 'lab_extraction'
   
    # composite primary keys via ActiveRecord plugin
    # I checked and these 4 columns provide uniqueness.
    self.primary_key = [:enum, :procdate, :postion, :block_num]
end
