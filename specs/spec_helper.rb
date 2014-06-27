require 'rspec'

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
