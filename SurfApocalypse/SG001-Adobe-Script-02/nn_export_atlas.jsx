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
        var ab, expPath, jsonPath, jsonOut;
        
        document.artboards.setActiveArtboardIndex(i);
        ab = document.artboards[i];
        
        //Set imageset path
        expPath = new Folder(folder.fsName + "/default.xcassets/" + document.name + ".spriteatlas/" + ab.name + ".imageset")
        
        if (!expPath.exists) {
            expPath.create();
        }
    
        //Set JSON path
        jsonPath = new File(folder.fsName + "/default.xcassets/" + document.name + ".spriteatlas/" + ab.name + ".imageset/Contents.json");
        jsonOut = jsonPath.open('w', undefined, undefined);
        jsonPath.encoding = "UTF-8";
        jsonPath.lineFeed = "Unix";
        if (jsonOut !== false) {
            jsonPath.writeln("{");
            jsonPath.writeln("    \"images\" : [");
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
                
                if (jsonOut !== false) {
                    jsonPath.writeln("      {");
                    jsonPath.writeln("          \"idiom\" : \"" + item.idiom + "\",");
                    jsonPath.writeln("          \"filename\" : \"" + ab.name + "_" + item.idiom + "@" + item.scale + ".png\",")
                    jsonPath.writeln("          \"scale\" : \"" + item.scale + "\"");
                    jsonPath.writeln("      },");
                }
            }
        }
        if (jsonOut !== false) {
                jsonPath.writeln("      {");
                jsonPath.writeln("          \"idiom\" : \"mac\",");
                jsonPath.writeln("          \"scale\" : \"2x\"");
                jsonPath.writeln("      }");
                jsonPath.writeln("  ],");
                jsonPath.writeln("    \"info\" : {");
                jsonPath.writeln("        \"version\" : 1,");
                jsonPath.writeln("        \"author\" : \"Neil North 2015 - Script\"");
                jsonPath.writeln("    }");
                jsonPath.writeln("}");
                jsonPath.close();
        }
    }

    //Create JSON files
    var path01, path02, output01, output02;
        
    path01 = new File(folder.fsName + "/default.xcassets/Contents.json")
        
    output01 = path01.open('w', undefined, undefined);
    path01.encoding = "UTF-8";
    path01.lineFeed = "Unix";
        
    if (output01 !== false) {
        path01.writeln("{");
        path01.writeln("    \"info\" : {");
        path01.writeln("        \"version\" : 1,");
        path01.writeln("        \"author\" : \"Neil North 2015 - Script\"");
        path01.writeln("    }");
        path01.writeln("}");
        path01.close();
    }
        
    path02 = new File(folder.fsName + "/default.xcassets/" + document.name + ".spriteatlas/Contents.json")
        
    output02 = path02.open('w', undefined, undefined);
    path02.encoding = "UTF-8";
    path02.lineFeed = "Unix";
        
    if (output02 !== false) {
        path02.writeln("{");
        path02.writeln("    \"info\" : {");
        path02.writeln("        \"version\" : 1,");
        path02.writeln("        \"author\" : \"Neil North 2015 - Script\"");
        path02.writeln("    }");
        path02.writeln("}");
        path02.close();
    }
}