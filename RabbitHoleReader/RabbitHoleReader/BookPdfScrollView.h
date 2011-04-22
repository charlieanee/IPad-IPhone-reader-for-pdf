//
//  BookPdfScrollView.h
//  ZoomingPDFViewer
//
//  Created by andrew batutin on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// this class contains the number of PDFScrollView
#import <Foundation/Foundation.h>
#import "PDFScrollView.h"
#import "PdfFileCoreWrapper.h"

@interface BookPdfScrollView : UIScrollView <UIScrollViewDelegate>
{
	NSArray* arrayPDFScrollView; // this array contains the PDFScrollView reference
	NSInteger numberOfPages; // number of pages to be shown on the view
	PdfFileCoreWrapper* pdfBook; // this object is a wrapper for CGPDFDocumentRef, and it conatain all the pdf, so it can take lots of heap space
	NSString* bookFileName; // name of the file 
	NSInteger currentPage; // current page to show
}

@property (nonatomic, readwrite) NSInteger currentPage;
@property (nonatomic, readwrite) NSInteger numberOfPages;
@property (nonatomic, retain) NSString* bookFileName;
@property (nonatomic, retain) NSArray* arrayPDFScrollView;
@property (nonatomic, retain) PdfFileCoreWrapper* pdfBook;

// custom initializer
- (id)initWithFrame:(CGRect)frame createPdfBook:(NSString*)bookName startFromPage:(NSInteger)pageNumber;
-(void)showTheBookWithFrame:(CGRect)frame createPdfBook:(PdfFileCoreWrapper*)bookWrapper startFromPage:(NSInteger)pageNumber;
-(void)loadPage:(NSInteger)pageNumber;
-(void)backgroundLoad:(BookPdfScrollView*)view;

@end
