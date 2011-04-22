//
//  RabbitHoleReaderAppDelegate.m
//  RabbitHoleReader
//
//  Created by andrew batutin on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RabbitHoleReaderAppDelegate.h"
// Const
static NSString* const kRabbitHoleReaderAppDelegateFileName = @"alice-in-wonderland-book.pdf";

@implementation RabbitHoleReaderAppDelegate

@synthesize pdfBook;

@synthesize window=_window;

@synthesize tabBarController=_tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Override point for customization after application launch.
	// Add the tab bar controller's current view as a subview of the window
	self.window.rootViewController = self.tabBarController;
	[self.window makeKeyAndVisible];
	pdfBook = [[PdfFileCoreWrapper createCGPDFDocumentRefByFileName:kRabbitHoleReaderAppDelegateFileName] retain]; // create pdf document object
	//create a view with pdf page 

    return YES;
}

- (void)dealloc
{
	[pdfBook release];
	[_window release];
	[_tabBarController release];
    [super dealloc];
}

@end
