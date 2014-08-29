#import "KHTML2PDFPlugin.h"
#import "NDHTMLtoPdf.h"

@implementation KHTML2PDFPlugin

- (void) createPdf:(CDVInvokedUrlCommand*)command {

    self.callbackId = command.callbackId;

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
#undef m(i)

    // Paper size
    NSArray* sizeValues = [options objectForKey:@"size"];
    float f0 = [[sizeValues objectAtIndex:0] floatValue];
    float f1 = [[sizeValues objectAtIndex:1] floatValue];
    CGSize pageSize = CGSizeMake(f0, f1);

    self.pdfCreator = [NDHTMLtoPDF createPDFWithURL:[NSURL URLWithString:urlStr]
                                         pathForPDF:path
                                           pageSize:pageSize
                                            margins:insets
                                       successBlock:^(NDHTMLtoPDF* htmlToPDF) {
                NSString* result = [NSString stringWithFormat:@"HTMLtoPDF did succeed (%@ / %@)", htmlToPDF, htmlToPDF.PDFpath];
                NSLog(@"%@", result);
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:htmlToPDF.PDFpath];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
                                         errorBlock:^(NDHTMLtoPDF* htmlToPDF) {
                NSString* result = [NSString stringWithFormat:@"HTMLtoPDF did fail (%@)", htmlToPDF];
                NSLog(@"%@", result);
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:result];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }];

}

@end
