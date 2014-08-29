cordova.define("de.kodira.cordova.Html2Pdf.Html2Pdf", function (require, exports, module) {
    function Html2Pdf() {
    }


    function paperSizes(lit) {
        if (lit === 'A4')
            return [595.2, 841.8];
        if (lit === 'Letter')
            return [612, 792];

        if (!(lit instanceof Array) || lit.length != 2)
            throw 'Wrong paper size: ' + lit;

        return lit;
    }

    Html2Pdf.prototype.createPdf = function (options, callback, error) {

        var ops = {};
        options = options || {};
        ops.type = options.type || 'URL';
        ops.size = paperSizes(options.size || 'A4');
        ops.url = options.url || 'www.kodira.de';
        ops.path = options.path || 'dummy.pdf';
        ops.margins = options.margins || [10, 10, 10, 10];

        var _callback = function (result) {
            if (typeof callback === 'function') callback(result);
        };

        var _error = function (msg) {
            if (typeof  error === 'function') error(msg);
        };

        return cordova.exec(_callback, _error, 'Html2Pdf', 'createPdf', [ops]);

    };


    module.exports = new Html2Pdf();


});
