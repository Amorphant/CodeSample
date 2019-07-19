## Swift Code Sample

### David Artman

This is a sample of my code, to give an indication of how I write and how maintainable it is. It's a simple command line utility for MacOS that reads scores from a formatted text file and outputs totals, sorted first by total points and then by name length.

## Build and Use Instructions

### Building

Use the following commands from the root folder of your cloned repo:

cd TasteTestReport
xcodebuild -scheme TasteTestReport build

From here, the executable is located at "Build/Products/Debug/TasteTestReport". The executable can also be built after opening the project in Xcode, and will be at the aforementioned location relative to the project file's directory.

### Expected Input

The expected format for input files is in sample-input.txt. Note that I did not include extensive validation of input files, since this was meant as a small sample of my code.

### Usage

The executable takes a single command line parameter, specifying the source file to be read. If no file is specified, it will attempt to read sample-input.txt from the current directory (note that after building as outlined above, this file will be one folder back).

### Testing

Unit tests can be run by opening the project in Xcode and hitting Cmd-U.
