# Your First iOS App Using UICukes

Apple provide a simple tutorial for introducing the tools, technologies and techniques (the three T's) of iOS app development. You can find the [tutorial online at the Apple developer website](https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/chapters/RM_YourFirstApp_iOS/Articles/00_Introduction.html) or as a [PDF](http://developer.apple.com/library/ios/DOCUMENTATION/iPhone/Conceptual/iPhone101/iPhone101.pdf) (links work at the time of writing), also find it in Xcode developer documentation under iOS, General, Your First iOS App. Apple call it iOS __101__, a basic introduction. This guide aims to supplement Apple's 101 documentation by following the same tutorial but with Cucumber as our driver: a 101 exercise in behaviour-driven design.

[Prerequisites](https://github.com/OCCukes/OCCukes/wiki/Prerequisites) include: Xcode and Apple's command line tools; Cucumber and Ruby using RVM. Apple's command line tools bundle Git. You will need this for cloning the [UICukes](https://github.com/OCCukes/UICukes) repository and its dependent submodules.

## App Requirements

The application has a very simple requirement: say hello to the user! First, it finds out the user's name. Then, when the user presses the Hello button, the app says hello. How sweet! User interface design reproduced below.

![AppSimulator](UICukes101/raw/master/Images/appSimulator.png)

Start with nothing, except for your project's README. No Xcode project exists as yet. It's always good to start out with your project's README describing your project's aims and objectives. Describing helps to crystallise your ideas and focus on the goals.

See the [list of commits](UICukes101/commits/master) for this project to follow the steps precisely. The following description walks you through the process, blow by blow.

Start by thinking about what your project's goals are. What features give the project its business value. Think up and type up your initial list of features. Write feature files, one for each feature under `features` within your project's root folder.

## Cucumber Folder Convention

Case is not normally significant for OS X machines. The file system is case-insensitive by default. Call the folder `features` or `Features`, it does not matter. By Ruby convention however, the directory has an all-lower-case name as do all files and folders below it, and use underscore delimiters. Recommend that you follow this convention for `features` in your iOS projects also. Use the normal camel-casing for everything else as per Apple conventions. Just stick to underscores for the `features` components.

The standard Cucumber folder structure lays out something like this.

- `UICukes101`: your project's root folder
	- `features`: Cucumber features live here
		* `my_first.feature`: features named for their title
		* `my_second.feature`: another one
		* `my_third.feature`: and another
		* `support`: Cucumber looks for this folder
			- `env.rb`: describes [things about the Cucumber execution environment](https://raw.github.com/OCCukes/OCCukes/master/features/support/env.rb)
		* `step_definitions`: defines steps for Ruby projects
			- `localhost.wire`: no Ruby steps here, redirect to Objective-C using the Cucumber wire protocol

This is how your Cucumber-based iOS app project folder will accommodate Cucumber features. It contains only a tiny amount of Ruby for integrating Cucumber and Xcode.

Back to our application development.

## First Feature

If you have [TextMate](http://macromates.com/) or [RubyMine](http://www.jetbrains.com/ruby/), writing features becomes easier. They understand the [Gherkin](https://github.com/cucumber/gherkin)-formatted feature files and have shortcuts for stubbing out templates for features and scenarios. Create `personal_greeting.feature` in `features`. Make its contents equal to:

	Feature: Personal greeting
	  In order to see my personal greeting
	  As an Apple iOS user
	  I want to enter my name and see a friendly hello

The above text describes the new feature's value or benefit, the user's role and the feature details--all in a human-readable form. This is the Connextra format for expressing user stories. Each line describes the _why_, the _who_ and the _what_ of the feature in question.

Not obvious at first, but the feature is executable. That is, Cucumber inputs the feature with a view to testing it and driving the development process itself by focusing on behaviour required to meet the feature, as opposed to writing software that we _think_ or _imagine_ that might meet the requirements.

Next, we need to run the feature. That requires an iOS app and Cucumber integration. Start with an Xcode template.

## Single View Application

Create an Xcode project for iOS. Use the Single View Application template. Please reference Apple's guide, [Getting Started](https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/chapters/RM_YourFirstApp_iOS/Articles/01_CreatingProject.html#//apple_ref/doc/uid/TP40011343-TP40012323-CH3-SW3). I called the app `UICukes101`, but you can call it anything. Use storyboards, ARC and unit tests. Make it Universal, for iPhone _and_ iPad.

You can launch the template-generated application straight away. It does nothing very interesting, although it does much in terms of launching and running software on your iOS device. From the user's point of view though, it displays a white screen.

![SingleViewAppTemplate](Images/SingleViewAppTemplate.png)

Boring. Very tempting to throw on some controls and wire up the view controller at this point. But no. Let Cucumber guide our steps!

## Install UICukes

