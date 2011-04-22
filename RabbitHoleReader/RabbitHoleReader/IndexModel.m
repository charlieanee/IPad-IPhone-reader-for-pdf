//
//  IndexModel.m
//  RabbitHoleReader
//
//  Created by andrew batutin on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IndexModel.h"
// Const - plist keys 
static NSString* const kIndexModelKeyChapterTitle = @"Chapter Name";
static NSString* const kIndexModelKeyChapterPage = @"Page Number";

@implementation IndexModel
@synthesize chapterName;
@synthesize chapterPage;

-(void)dealloc
{
	[chapterName release];
	[super dealloc];
}

#pragma mark - Public methods
+(IndexModel*)modelFromDictionary: (NSDictionary*)info
{
	IndexModel* model = [[[IndexModel alloc] init] autorelease]; // create model
	// cet model propeties by info content
	model.chapterName = [info objectForKey:kIndexModelKeyChapterTitle];
	model.chapterPage = [[info valueForKey:kIndexModelKeyChapterPage] integerValue];
	
	return model;
}

@end
