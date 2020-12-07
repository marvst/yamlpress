require 'sinatra'
require 'yaml'

get '/:endpoint' do
  endpoint = params['endpoint']
  file_name = endpoint + '.yml'

  begin
    file_content = File.read("contents/#{file_name}")
    file_components = YAML.safe_load(file_content)

    @page_content = file_components

    erb :default_template
  rescue StandardError => e
    puts "Failed to load the endpoint because: #{e}"
    "Oops! Seems like this page doesn't exist"
  end
end
