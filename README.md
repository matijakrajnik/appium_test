### Installing and running appium
To install appium, follow procedure in [this tutorial](http://appium.io/slate/en/tutorial/ios.html?ruby#native-ios-automation).
To run appium server change location to directory with installed appium and execute command
```
node .
``` 

### Inspect application elements
First, get local copy of this repository with
```
git clone https://github.com/matijakrajnik/appium_test.git
```
Then open root directory using
```
cd appium_test
```
There are 2 ways to inspect application elements, with ARC and GUI.
#### Inspect elements with ARC
First way to inspect elements is using Appium Ruby Console (ARC). To start ARC, simply run command
```
arc
```
In ARC now you can type command ```page``` to see all elements in current context.

#### Inspect elements with GUI
Second way to inspect elements is with Appium GUI. Download Appium [here](https://bitbucket.org/appium/appium.app/downloads/appium-1.1.0.dmg) and install it.
After you open appium go to ```Developer Settings```, check "Use External Appium Package" and select directory with compiled Appium. Then click on ```iOS Settings``` and under "App Path" select application you wish to inspect. If appium server and application are not started with terminal, start it with clicking on button ```Launch```. When application is opened click ```Inspector``` to inspect all elements.

### Run test example
Run test example with
```
rspec specs/test.rb
```
