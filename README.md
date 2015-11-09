# Populate Core Data Example

This is an example Xcode project on how you can populate your Core Data database in your iOS or OS X application.

## The case

Sometimes you have a big amount of data that you want fill your Core Data database with data from (for example a webservice or an Excel file).

In order to do this I have setup a small example Xcode project. This project contains two targets:

- The iOS application target
- The Command Line Tool target

### Command Line Tool

Target name: **Populator**

The _Command Line Tool_ target is responsible for generating the database. This tool will generate the sqlite file an move it to the correct location so your it will be added to your iOS target.

### iOS application

Target name: **Glider Application**

In the _Preloaded Database_ target the populated sqlite file will be copied to the correct location and prepares the Core Data setup with the help of MagicalRecord.

**MagicalRecord** is used because we want to reduce the amount of code in order to initialize and use Core Data.

## Used files.

Here is some more information about the used files.

### MagicalRecord+Seed.h

Import this category in your AppDelegate. Your preseed database will be copied to the correct location. And you will be able to set a version for future updates. When you want to release a new version of the app with new preseed data, you just have to run the Command Line Tool and increase the `kCurrentSeedVersion` integer value. The rest will be handled for your.

Here is how to use it from your `AppDelegate`:

```
[MagicalRecord setupSeededStackWithName:@"Store.sqlite"];
```

### MagicalRecord+WAL.h

Since iOS 7 and OS X Mavericks Core Data uses a Write-Ahead Logging journalling mechanism. This has the disavantage that when you create an sqlite preseeded database, that the data transations are saved to some _wal-files_. So when you copy the sqlite file, no data resides in it. Therefore we disabled the WAL journalling with this category.

More info on this can be found in the [Mac documentation](https://developer.apple.com/library/mac/qa/qa1809/_index.html).

### DatabaseSeed.h

The DatabaseSeed object will create the sqlite instance that will be used as the preseeded database. It provides a save block so you to handle the saving for you.

```
DatabaseSeed *seed = [DatabaseSeed new];
[seed save:^(NSManagedObjectContext *localContext) {
  ...
}];
[seed clean];
```

You just have to perform the importing (creation of your Core Data objects) inside the save block.

## LICENSE

Copyright (c) 2015 iCapps

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


