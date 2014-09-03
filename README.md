# Cordova HTML 2 PDF converter (iOS only) #

by [Kodira](http://kodira.de)

## DESCRIPTION ##

This plugin enables URL based PDF generation. Pages are produces by printing the HTML content into a PDF. 

## SUPPORTED PLATFORMS ##

- **iOS** only (for now)


## INSTALLATION ##

Through the Command-line Interface:

```bash
cordova plugin add https://github.com/kodira/cordova-html2Pdf.git && cordova prepare
```

## USING THE PLUGIN

Once the device is ready, the Html2Pdf object is accessible via ``window.plugin.Html2Pdf``.

Example:

```javascript
        var options = {
            url: 'www.kodira.de', // the url pointing to the HTML document to convert into PDF
            size: 'A4', // 'A4', 'Letter', or numeric values, e.g.: [595.2, 841.8] (in points with 72 points per inch). Default is 'A4'
            path: 'dummy.pdf', // path to the generated PDF file, default is 'dummy.pdf'
            margins: [10, 10, 10, 10],  // [top, left, bottom, right], default is [10,10,10,10],
            delay:1.0 // give the page some extra time (in seconds) after loading (e.g. to execute some javascript), default  is 0.0 seconds.
        };

        window.plugin.Html2Pdf.createPdf(options, function (filePath) {
            // 'filePath' contains the absolute path to the generated PDF file, e.g. /var/mobile/Applications/AF4A8258-6A86-49BF-8B67-C37E4D4EAB24/Documents/dummy.pdf
            // If you use the inapp browser plugin (https://github.com/apache/cordova-plugin-inappbrowser), you can display the PDF like this
            window.open('file://' + filePath, '_blank', 'location=yes');


        });
```

## LICENSE ##

    The MIT License

    Copyright (c) 2014 Kodira UG (haftungbeschränkt)

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.

## CREDITS ##

* [iOS-htmltopdf](https://github.com/iclems/iOS-htmltopdf).



