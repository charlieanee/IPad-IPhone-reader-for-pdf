//
//  RabbitHoleReaderAppDelegate.h
//  RabbitHoleReader
//
//  Created by andrew batutin on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdfFileCoreWrapper.h"

@interface RabbitHoleReaderAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> 
{
	PdfFileCoreWrapper* pdfBook; // this object is a wrapper for CGPDFDocumentRef, and it conatain all the pdf, so it can take lots of heap space
}

@property (nonatomic, retain) PdfFileCoreWrapper* pdfBook;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
