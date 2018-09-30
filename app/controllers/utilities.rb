require 'csv'

# Public: Parse a CSV file containing project information
#
# project_data - The CSV file to be parsed.
#
# Returns nothing.
def parse_csv(project_data)
  CSV.foreach(project_data, quote_char: '"', col_sep: ',', row_sep: :auto, headers: true) do |row|
    team_number = row[0]
    project_name = row[1]


    # TODO: create new project objects from parsed data
  end
end
