class MassActions


	def self.insert(table_name, attributes, records_arr)

		sorted_attributes = attributes.sort
		values = []

		single_placeholder = placeholders_factory(sorted_attributes.size + 2) # +2 for created_at and updated_at
		values_placeholders = []

		timestamp = Time.now.strftime('%Y-%m-%d %H:%M:%S')

		records_arr.map do |record|
			values_placeholders << single_placeholder
			sorted_attributes.map do |attr|
				values << record[attr] || 'NULL'
			end
			values << timestamp << timestamp
		end

		bulk_insert_sql_arr = ["INSERT INTO #{table_name} (#{(sorted_attributes + [:created_at, :updated_at]).join(',')}) VALUES #{values_placeholders.join(', ')}"] + values
		begin
			sql = ActiveRecord::Base.send(:sanitize_sql_array, bulk_insert_sql_arr)
			ActiveRecord::Base.connection.execute(sql)
			true
		rescue => e
			puts e.message
			false
		end
	end

	def self.placeholders_factory(num)
		"(#{(['?']*num).join(',')})"
	end

end