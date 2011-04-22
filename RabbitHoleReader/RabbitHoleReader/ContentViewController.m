//
//  ContentViewController.m
//  RabbitHoleReader
//
//  Created by andrew batutin on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContentViewController.h"
#import "BookViewController.h"

@implementation ContentViewController
@synthesize contentTableView;
@synthesize arrayOfChapterModels;

- (void)dealloc
{
    [arrayOfChapterModels release];
	[contentTableView release];
	[super dealloc];
}

-(void) viewDidLoad
{
	[self loadDataFromPlist:@"Index"];
	[super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arrayOfChapterModels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	// get the index model
	IndexModel *model = [arrayOfChapterModels objectAtIndex:indexPath.row];
	cell.textLabel.text = model.chapterName;
	
	return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	//BookViewController *detailViewController = [[BookViewController alloc] initWithNibName:@"BookViewController" bundle:nil];
	//detailViewController.view.frame = self.view.frame;
   // [self.navigationController pushViewController:detailViewController animated:YES];
   // [detailViewController release];
	IndexModel *model = [arrayOfChapterModels objectAtIndex:indexPath.row];
	
	UINavigationController *detailViewController = (UINavigationController *)[APP.tabBarController.viewControllers objectAtIndex:1];
	
	BookViewController* book = (BookViewController* )detailViewController.visibleViewController;
	book.pageNumber = model.chapterPage;
	
	[book.pdfBookScrollView loadPage:book.pageNumber];
	[APP.tabBarController setSelectedIndex:1];
}

#pragma mark - Private methods

// Load data from plist to dataArray
-(void)loadDataFromPlist:(NSString*)plistName
{
	NSArray *plistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Index" ofType:@"plist"]]; // load data from plist
	NSMutableArray *models = [[NSMutableArray alloc] init]; // buffer array
	// plist parsing
	for( NSDictionary *modelInfo in plistArray )
	{
		IndexModel *model = [IndexModel modelFromDictionary:modelInfo];
		if( model != nil )
			[models addObject:model];
	}
	arrayOfChapterModels = [[NSArray alloc] initWithArray:models]; // array init with models
	[models release]; // by-by buffer!
}

@end
