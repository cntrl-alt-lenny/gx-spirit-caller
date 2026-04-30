/* func_ov002_021dec10: `b & func_ov002_021de134(a, b, 0xe, 0x1000)`. */

extern int func_ov002_021de134(int a, int b, int c, int d);

int func_ov002_021dec10(int a, int b) {
    int r = func_ov002_021de134(a, b, 0xe, 0x1000);
    return b & r;
}
