/**
 ** Neil North 2015
 ** Assumes original artboard sizes are 1024 sq
 **/

var iosExportOptions = [
    {
        scale: "16",
        scaleFactor: 1.5625
    },
    {
        scale: "29",
        scaleFactor: 2.8320313
    },
    {
        scale: "32",
        scaleFactor: 3.125
    },
    {
        scale: "40",
        scaleFactor: 3.90625
    },
    {
        scale: "58",
        scaleFactor: 5.6640625
    },
    {
        scale: "64",
        scaleFactor: 6.25
    },
    {
        scale: "76",
        scaleFactor: 7.421875
    },
    {
        scale: "80",
        scaleFactor: 7.8125
    },
    {
        scale: "87",
        scaleFactor: 8.4960938
    },
    {
        scale: "120",
        scaleFactor: 11.71875
    },
    {
        scale: "128",
        scaleFactor: 12.5
    },
    {
        scale: "152",
        scaleFactor: 14.84375
    },
    {
        scale: "180",
        scaleFactor: 17.578125
    },
    {
        scale: "256",
        scaleFactor: 25
    },
    {
        scale: "512",
        scaleFactor: 50
    },
    {
        scale: "1024",
        scaleFactor: 100
    },
    {
        scale: "2048",
        scaleFactor: 200
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
        expPath = new Folder(folder.fsName + "/" + ab.name)
        
        if (!expPath.exists) {
            expPath.create();
        }
        
        // For each export option
        for (var key in iosExportOptions) {
            var file, options;
            
            if (iosExportOptions.hasOwnProperty(key)) {
                var item = iosExportOptions[key];
                
                file = new File(expPath.fsName + "/" + ab.name + "_" + item.scale + ".png");
                
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