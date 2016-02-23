/**
 ** Neil North 2015
 ** Assumes original artboard sizes are for iPad @2x
 **/

var iosExportOptions = [
    {
        scale: "1x",
        scaleFactor: 50,
        idiom: "ipad"
    },
    {
        scale: "2x",
        scaleFactor: 100,
        idiom: "ipad"
    },
    {
        scale: "2x",
        scaleFactor: 42,
        idiom: "iphone"
    },
    {
        scale: "3x",
        scaleFactor: 78,
        idiom: "iphone"
    },
    {
        scale: "1x",
        scaleFactor: 93.75,
        idiom: "mac"
    },
    {
        scale: "1x",
        scaleFactor: 70.3125,
        idiom: "tv"
    }
];

var folder = Folder.selectDialog("Select export directory");
var document = app.activeDocument;

if(document && folder) {
     
    var i;
    
    //For each artboard
    for (i = document.artboards.length - 1; i >= 0; i--) {
        var ab, expPath;
        
        document.artboards.setActiveArtboardIndex(i);
        ab = document.artboards[i];
        
        //Set imageset path
        expPath = new Folder(folder.fsName + "/" + ab.name + ".imageset")
        
        if (!expPath.exists) {
            expPath.create();
        }
        
        // For each export option
        for (var key in iosExportOptions) {
            var file, options;
            
            if (iosExportOptions.hasOwnProperty(key)) {
                var item = iosExportOptions[key];
                
                file = new File(expPath.fsName + "/" + ab.name + "_" + item.idiom + "@" + item.scale + ".png");
                
                options = new ExportOptionsPNG24();
                options.transparency = true;
                options.artBoardClipping = true;
                options.antiAliasing = true;
                options.verticalScale = item.scaleFactor;
                options.horizontalScale = item.scaleFactor;
                
                document.exportFile(file, ExportType.PNG24, options);
            }
        }
    }
}