//
//  ContentViewController.h
//  RabbitHoleReader
//
//  Created by andrew batutin on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexModel.h"

@interface ContentViewController : UIViewController 
{
	UITableView* contentTableView; // content table
	NSArray* arrayOfChapterModels; // array with chapter models
}

@property (nonatomic, retain) NSArray* arrayOfChapterModels;
@property (nonatomic, retain) IBOutlet UITableView* contentTableView; // content table

// Load data from plist to dataArray
- (void)loadDataFromPlist:(NSString*)plistName;

@end
