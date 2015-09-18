RSpec.configure do |config|
  config.before(:each) do
    Marmotta::Connection.new(
      uri: "http://localhost:8983/marmotta", 
      context: Rails.env
    ).delete_all
  end
end
