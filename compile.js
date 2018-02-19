var fs = require('fs'),
    Processing = require('processing'),
    canvas = Processing.createElement('canvas');

fs.readFile('./visual.pde', function(err, data) {
    var compiled = Processing.compile(data.toString('utf-8')),
    p5 = new Processing(canvas, compiled),
    out = fs.createWriteStream('/path/to/output.png'),
    stream = canvas.createPNGStream();

    stream.pipe(out);
});
