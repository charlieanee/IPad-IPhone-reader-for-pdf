//
//  BookPdfScrollView.m
//  ZoomingPDFViewer
//
//  Created by andrew batutin on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BookPdfScrollView.h"

static float const kIBookPdfScrollViewgridSpace = 50.0f; // space between pdf views

@implementation BookPdfScrollView
@synthesize numberOfPages;
@synthesize bookFileName;
@synthesize pdfBook;
@synthesize arrayPDFScrollView;
@synthesize currentPage;

-(void)dealloc
{
	[arrayPDFScrollView release];
	[bookFileName release];
	[pdfBook release];
	[super dealloc];
}

- (id)initWithFrame:(CGRect)frame createPdfBook:(NSString*)bookName startFromPage:(NSInteger)pageNumber 
{
    if ((self = [super initWithFrame:frame])) 
	{
		self.numberOfPages = 1;
		self.bookFileName = bookName;
		self.currentPage = pageNumber;
		self.frame = frame;
		if ([self respondsToSelector:@selector(backgroundLoadInitial:)]) 
			[self performSelectorInBackground:@selector(backgroundLoadInitial:) withObject:self];

	}
    return self;
}

#pragma mark -
#pragma mark UIScrollView delegate methods

// A UIScrollView delegate callback, called when the user starts zooming. 
// We return our current TiledPDFView.
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return scrollView;
}

#pragma mark - Private methods

-(void)backgroundLoadInitial:(BookPdfScrollView*)view
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	view.pdfBook = [[PdfFileCoreWrapper createCGPDFDocumentRefByFileName:view.bookFileName] retain]; // create pdf document object
	//create a view with pdf page 

	[self backgroundLoad:view];
	[pool release];
}

-(void)backgroundLoad:(BookPdfScrollView*)view
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	CGFloat maxContentWidth = 0;
	
	for (UIView* viewDelete in view.subviews)
	{
		if ( [viewDelete isMemberOfClass:[PDFScrollView class]] )
			[viewDelete removeFromSuperview];
	}
	
	//create a view with pdf page 
	int arrayIndex = 0;
	NSMutableArray* bufferArray = [[NSMutableArray alloc] init];
	for (int i = view.currentPage; i <= view.currentPage + numberOfPages; i++)
	{
		if ( i <= APP.pdfBook.maxPage ) 
		{
			
		
		
		// create a view with pdf
		PDFScrollView *sv = [[PDFScrollView alloc] initWithFrame:CGRectMake(view.frame.origin.x - 0, view.frame.origin.y, view.frame.size.width , view.frame.size.height) andWithPageNumber:i andPdfFileReference:view.pdfBook.pdfRef];
		
		if ( [bufferArray count] >= 1 )
		{
			PDFScrollView* bufferView = [bufferArray objectAtIndex:arrayIndex];
			sv.frame = CGRectMake(bufferView.frame.origin.x + sv.frame.size.width + kIBookPdfScrollViewgridSpace, bufferView.frame.origin.y, bufferView.frame.size.width , bufferView.frame.size.height);
			arrayIndex++;
		}
		
		
		maxContentWidth =  CGRectGetMaxX( sv.frame );
		[bufferArray addObject:sv];
		// added it to scroll view
		[view  addSubview:sv];
		[sv release];
		}
	
		
	}
	
	[view setContentSize:CGSizeMake(maxContentWidth, view.frame.origin.y)];
	[arrayPDFScrollView release];
	arrayPDFScrollView = [[NSArray alloc] initWithArray:bufferArray];
	[bufferArray release];
	[pool release];
}

#pragma mark - Public methods

-(void)showTheBookWithFrame:(CGRect)frame createPdfBook:(PdfFileCoreWrapper*)bookWrapper startFromPage:(NSInteger)pageNumber 
{
	self.pdfBook = bookWrapper;
	self.currentPage = pageNumber;
	self.frame = frame;
	if ([self respondsToSelector:@selector(backgroundLoadInitial:)]) 
		[self performSelectorInBackground:@selector(backgroundLoad:) withObject:self];
}

-(void)loadPage:(NSInteger)pageNumber
{
	self.currentPage = pageNumber;
	if ([self respondsToSelector:@selector(backgroundLoad:)]) 
		[self performSelectorInBackground:@selector(backgroundLoad:) withObject:self];
}

@end
