# screenduo4linux
Asus ScreenDUO gadget text
This project builds on the traditional ability to send a specially prepared picture to the Asus screenDUO.
It allows you to send multiline text to the device (via bash or other program).  It builds on the work of others,
as seen in main.c.  It needs more work (this application cannot use/support the device buttons).  It can
automatically wrap end of line text and uses \n to send newlines; uses \c[0-F] to set preset colors (see colorpick.sh for an example); uses \aRRGGBB to change text color where each of RR GG and BB can take values from 00 to FF (hexidecimal); uses \px,y, to set a pixel in the current color at position x,y where on this device x can range from 0 to 320 and y can range from 0-240; \bx1,x2,y1,y2, creates a box in the current color at locations denoted by x1, x2, y1 and y2.  Note the use of commas in the examples, particularly the trailing commas in the pixel and box examples.
Example: ./duo "\aFF0000\b0,320,0,240,\a00FF00Fred" makes the screen FF0000 (red) from x(0-320) y(0-240) ie: the whole screen, then changes the current color to 00FF00 (green) and prints Fred (in green) on the top line (although green text on a red background almost looks yellow).

Use:  ./duo mytext   or  ./duo "mytext\nsecond line\nThird line"  You can also use (without quotes) ./duo text\nsecondline
TODO:  1) color text (already done, run colorpick.sh or duoinfo.sh).
       1a) allow the user to set any (rgb) color (done)
       2) drawing graphs (in any color) (done - can draw an arbitrary box in any color)
       3) button input (possibly pulling scan data using lirc)
       4) command line picture with color text overlaid.
The 8x8 font file is available here but also available at other places on github (and has its own attribution in the file).
I may consider using or building another font file that would look better on this device.

