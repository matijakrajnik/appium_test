require 'rspec'

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

APP_PATH = './UICatalog.app'

def desired_caps
  {
    caps: {
      platformName: 'iOS',
      deviceName:  'iPad Simulator',
      app: APP_PATH
    },
    appium_lib: {
      sauce_username: nil, # don't run on sauce
      sauce_access_key: nil,
      debug: true,
      wait: 10,
    }
  }
end
