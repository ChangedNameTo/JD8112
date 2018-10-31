require 'csv'

# Public: Parse a CSV file containing project information
#
# project_data - The CSV file to be parsed.
#
# Returns nothing.
def parse_csv(project_data)
  CSV.foreach(project_data, quote_char: '"', col_sep: ',', row_sep: :auto, headers: true) do |row|
    team_number    = row[0]
    expo_session   = row[1]
    table_number   = row[2]
    project_name   = row[3]
    project_desc   = row[4]
    course_section = row[5]
    # TODO: create new project objects from parsed data
    puts "#{team_number}, #{project_name}"
  end
end

parse_csv(File.expand_path("../../test/sample_csv_small.csv"))