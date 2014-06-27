require 'rspec'

ZIP_PATH = './UICatalog.zip'
ZIP_FILENAME = File.basename(ZIP_PATH)

SAUCE_USERNAME = ENV["SAUCE_USERNAME"]
SAUCE_ACCESS_KEY = ENV["SAUCE_ACCESS_KEY"]

def desired_caps
  {
    caps: {
      appium_version: '1.1.0',
      platformName: 'iOS',
      platformVersion: '7.1',
      deviceName:  'iPad Simulator',
      app: "sauce-storage:#{ZIP_FILENAME}"
    }
  }
end

def set_env_variables
  `declare -r SAUCE_USERNAME=""`
  `declare -r SAUCE_ACCESS_KEY=""`
end

def unset_env_variables
  `unset SAUCE_USERNAME`
  `unset SAUCE_ACCESS_KEY`
end

def upload_zip
  puts "Uploading application..."
  output = %x{ curl -u $SAUCE_USERNAME:$SAUCE_ACCESS_KEY -X POST "http://saucelabs.com/rest/v1/storage/$SAUCE_USERNAME/#{ZIP_FILENAME}?overwrite=true" -H \"Content-Type: application/octet-stream" --data-binary @#{ZIP_FILENAME} }
  if output.include?("\"username\": \"#{SAUCE_USERNAME}\"")
    puts "Application uploaded successfully."
  else
    puts "Application upload failed!"
  end
end

def auth_details
  un = SAUCE_USERNAME
  pw = SAUCE_ACCESS_KEY

  unless un && pw
    STDERR.puts <<-EOF
      Your SAUCE_USERNAME or SAUCE_ACCESS_KEY environment variables
      are empty or missing.

      You need to set these values to your Sauce Labs username and access
      key, respectively.

      If you don't have a Sauce Labs account, you can get one for free at
      http://www.saucelabs.com/signup
    EOF

    exit
  end

  return "#{un}:#{pw}"
end

def server_url
  "http://#{auth_details}@ondemand.saucelabs.com:80/wd/hub"
end

def rest_jobs_url
  "https://#{auth_details}@saucelabs.com/rest/v1/#{SAUCE_USERNAME}/jobs"
end

# Because WebDriver doesn't have the concept of test failure, use the Sauce
# Labs REST API to record job success or failure
def update_job_success(job_id, success)
  RestClient.put "#{rest_jobs_url}/#{job_id}", { 'passed' => success }.to_json, :content_type => :json
end

