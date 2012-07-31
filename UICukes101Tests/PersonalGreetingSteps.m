//
//  PersonalGreetingSteps.m
//  UICukes101Tests
//
//  Created by Roy Ratcliffe on 30/07/2012.
//  Copyright (c) 2012 The OCCukes Organisation. All rights reserved.
//

#import <UICukes/UICukes.h>

__attribute__((constructor))
static void StepDefinitions()
{
	[OCCucumber when:@"^the user enters his name \"(.*?)\"$" step:^(NSArray *arguments) {
		UIATarget *localTarget = [UIAutomation localTarget];
		id textFields = [localTarget valueForKeyPath:@"frontMostApp.mainWindow.textFields"];
		id textField = [textFields firstWithName:@"Name"];
		[textField shouldNot:be_an(@"UIAElementNil")];
	} file:__FILE__ line:__LINE__];
	
	[OCCucumber when:@"^presses the \"(.*?)\" button$" step:^(NSArray *arguments) {
		// express the regular expression above with the code you wish you had
		[OCCucumber pending:@"TODO"];
	} file:__FILE__ line:__LINE__];
	
	[OCCucumber then:@"^the greeter app says a friendly \"(.*?)\"$" step:^(NSArray *arguments) {
		// express the regular expression above with the code you wish you had
		[OCCucumber pending:@"TODO"];
	} file:__FILE__ line:__LINE__];
}
