# screenduo4linux
Asus ScreenDUO gadget text
This project builds on the traditional ability to send a specially prepared picture to the Asus screenDUO.
It allows you to send multiline text to the device (via bash or other program).  It builds on the work of others,
as seen in main.c.  It needs more work (it cannot display any color text other than white on black so far).  It can
automatically wrap end of line text and uses \n to send newlines.

Use:  ./duo mytext   or  ./duo "mytext\nsecond line\nThird line"  You can also use (without quotes) ./duo text\\nsecondline
TODO:  1) color text (already done, run colorpick.sh or duoinfo.sh).
       1a) allow the user to set any (rgb) color
       2) drawing graphs (in any color)
       3) button input (possibly pulling scan data using lirc)
       4) command line picture with color text overlaid.
The 8x8 font file is available here but also available at other places on github (and has its own attribution in the file).
I may consider using or building another font file that would look better on this device.
