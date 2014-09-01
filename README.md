# Cordova HTML 2 PDF converter (iOS only for now) #

!! WORK IN PROGRESS !!

by [Kodira](http://kodira.de)

## DESCRIPTION ##

* This is a quick and dirty cordova plugin wrapping iOS-htmltopdf.


## SUPPORTED PLATFORMS ##

- **iOS** only (for now)


## INSTALLATION ##

Through the [Command-line Interface][CLI]:

```bash
cordova plugin add https://github.com/kodira/cordova-html2Pdf.git && cordova prepare
```

## USING THE PLUGIN

Once the device is ready, the Html2Pdf is accessible at ``window.plugin.Html2Pdf```.

Example:

```javascript
        var options = {
            url: url, // the url to convet
            size: 'A4', // 'A4', 'Letter', or numeric values, e.g.: [595.2, 841.8] (in points with 72 points per inch). Default is 'A4'
            path: 'dummy.pdf', // path to the pdf, default is 'dummy.pdf'
            margins: [10, 10, 10, 10] // [top, left, bottom, right], default is [10,10,10,10]
        };

        window.plugin.Html2Pdf.createPdf(options, function (filePath) {
            window.open('file://' + filePath, '_blank', 'location=yes');
        });
```

## LICENSE ##

    The MIT License

    Copyright (c) 2012 Kodira UG (haftungbeschränkt)

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

* iOS-htmltopdf



