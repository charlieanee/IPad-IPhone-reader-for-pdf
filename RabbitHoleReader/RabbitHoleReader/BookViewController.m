//
//  BookViewController.m
//  RabbitHoleReader
//
//  Created by andrew batutin on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BookViewController.h"


@implementation BookViewController
@synthesize pdfBookScrollView;
@synthesize pageNumber;

- (void)dealloc
{
    [pdfBookScrollView release];
	[super dealloc];
}

#pragma mark View life cicle

-(void)viewDidLoad
{
	pdfBookScrollView.numberOfPages	= 2;
	if ( pageNumber==0 )
		pageNumber = 1;
	[pdfBookScrollView showTheBookWithFrame:[pdfBookScrollView bounds] createPdfBook:APP.pdfBook startFromPage:pageNumber];
	
	UIBarButtonItem *prevPageBtn = [[UIBarButtonItem alloc] initWithTitle:@"Prev Page" style:UIBarButtonItemStyleBordered target:self action:@selector(prevPage:)];
	self.navigationItem.leftBarButtonItem = prevPageBtn;
	[prevPageBtn release];
	
	UIBarButtonItem *nextPageBtn = [[UIBarButtonItem alloc] initWithTitle:@"Next Page" style:UIBarButtonItemStyleBordered target:self action:@selector(nextPage:)];
	self.navigationItem.rightBarButtonItem = nextPageBtn;
	[nextPageBtn release];

	
	[super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)prevPage:(id)sender
{
	[self.pdfBookScrollView loadPage:--self.pageNumber];
}

-(void)nextPage:(id)sender
{
	if ( ++self.pageNumber <=  APP.pdfBook.maxPage - pdfBookScrollView.numberOfPages)
	{
		[self.pdfBookScrollView loadPage:++self.pageNumber];
	}
	else
	{
		--self.pageNumber;
	}
}

@end
