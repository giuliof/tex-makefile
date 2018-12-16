# tex-makefile
Useful makefile for (relatively) big LaTeX projects with automatic generation of graphics from SVG and TEX files (i.e. Inkscape or Circuitikz documents).
Can be launched from any IDE (like TeXstudio) with small set-up.

## Usage
1. Create a project folder and put makefile in it.
2. If you make use of included .tex portions, add subfolders to TEX_DIR variable
3. Launch `$ make tree` to create folder tree
4. Put main document in project root and call it main.tex (or manually edit makefile)
5. Put raster images in `img/rasters`
6. Put image projects in `img/originals` (i.e. .SVG, .TEX, ...). Note: for .TEX images is suggested the standalone document class.
7. Do `$ make` and wait. You'll find the document in `build/main.pdf`

## Configuration for TeXstudio
1. Open settings (Option > Configure TeXstudio);
2. In Build menu add new user command (writing `make | txs:///view`), in additional paths add `build` folder for log and PDF files. Then save;
3. Open again settings. In Shortcuts search for user command in Menus>Tools>User then bind with a custom shortkey
4. Save, close TeXstudio.

## Further improvements
* generate raster files from .xcf GIMP files
* adapt to work with windows
