#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@class NDHTMLtoPDF;

@interface KHTML2PDFPlugin : CDVPlugin

@property NDHTMLtoPDF* pdfCreator;
@property (nonatomic, copy) NSString* callbackId;

- (void)createPdf:(CDVInvokedUrlCommand*)command;

@end

#pragma mark - Logging tools

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
