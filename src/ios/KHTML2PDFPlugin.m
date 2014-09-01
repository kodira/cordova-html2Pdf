#import "KHTML2PDFPlugin.h"
#import "NDHTMLtoPdf.h"

@implementation KHTML2PDFPlugin


-(NSMutableArray*) requests{
    if (! _requests){
        _requests = [[NSMutableArray alloc]init];
    }
    return _requests;
}

- (void) createPdf:(CDVInvokedUrlCommand*)command {

    NSDictionary* options = [command.arguments objectAtIndex:0];
    NSLog(@"HTMl2PDF createPdf:%@", options);

    // The url to convert
    NSString* urlStr = [options objectForKey:@"url"];

    // the destination path
    NSString* path = [[NSString stringWithFormat:@"~/Documents/%@", [options objectForKey:@"path"]] stringByExpandingTildeInPath];

    // Margins
    NSArray* margins = [options objectForKey:@"margins"];
#define m(i)   [[margins objectAtIndex:i] doubleValue]
    UIEdgeInsets insets = UIEdgeInsetsMake(m(0), m(1), m(2), m(3));
#undef m
    
    // Paper size
    NSArray* sizeValues = [options objectForKey:@"size"];
    float f0 = [[sizeValues objectAtIndex:0] floatValue];
    float f1 = [[sizeValues objectAtIndex:1] floatValue];
    CGSize pageSize = CGSizeMake(f0, f1);
    
    id <CDVCommandDelegate> commandDelegate = self.commandDelegate;
    NDHTMLtoPDF* pdfCreator = [NDHTMLtoPDF createPDFWithURL:[NSURL URLWithString:urlStr]
                                         pathForPDF:path
                                           pageSize:pageSize
                                            margins:insets
                                       successBlock:^(NDHTMLtoPDF* htmlToPDF) {
                NSString* result = [NSString stringWithFormat:@"HTMLtoPDF did succeed (%@ / %@)", htmlToPDF, htmlToPDF.PDFpath];
                NSLog(@"%@", result);
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:htmlToPDF.PDFpath];
                [commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                [self.requests removeObject:htmlToPDF];
            }
                                         errorBlock:^(NDHTMLtoPDF* htmlToPDF) {
                NSString* result = [NSString stringWithFormat:@"HTMLtoPDF did fail (%@)", htmlToPDF];
                NSLog(@"%@", result);
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:result];
                [commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                [self.requests removeObject:htmlToPDF];
            }];
    
    [self.requests addObject:pdfCreator];

}

@end
