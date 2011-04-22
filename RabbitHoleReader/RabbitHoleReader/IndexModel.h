//
//  IndexModel.h
//  RabbitHoleReader
//
//  Created by andrew batutin on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

// model of the index from plist
@interface IndexModel : NSObject 
{
    NSString* chapterName; // name of the chapter
	NSInteger chapterPage; // pahe of the chapter in pdf file, real page number, but not the visible number on page
}

@property (nonatomic, retain) NSString* chapterName; // name of the chapter
@property (nonatomic, readwrite) NSInteger chapterPage; // name of the chapter

// crate model from dictionary
+(IndexModel*)modelFromDictionary: (NSDictionary*)info;

@end
