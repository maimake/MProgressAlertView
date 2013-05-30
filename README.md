MProgressAlertView
==================

an AlertView with ProgressView And Label for progress.


Usage
------------------
```objective-c
- (IBAction)onAlert:(UIButton*)sender {
  MProgressAlertView* progressAlert = [[[MProgressAlertView alloc] initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", nil] autorelease];
  [progressAlert show];

  progressAlert.progressView.progress = 0.5f;
  progressAlert.progressLabel.text = @"50%";
}

```

Screenshots
--------------------
![Progress with no button] (http://dl.dropboxusercontent.com/s/0yr5jt63zj1iodc/MProgressAlertView1.png "Progress with no button")
![Progress with no button] (http://dl.dropboxusercontent.com/s/0mlz65f7vwaxzeh/MProgressAlertView2.png "Progress with no button")

License
---------------------
The MIT License (MIT)

Copyright (c) 2013 MaiMake 

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
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
