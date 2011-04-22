//
//  BookViewController.h
//  RabbitHoleReader
//
//  Created by andrew batutin on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookPdfScrollView.h"

@interface BookViewController : UIViewController 
{
	NSInteger pageNumber; // current page number
	BookPdfScrollView* pdfBookScrollView; // scrool view with the pdf pages
}

@property (nonatomic, retain) IBOutlet BookPdfScrollView* pdfBookScrollView; // scrool view with the pdf pages
@property (nonatomic, readwrite) NSInteger pageNumber; // current page number

@end
