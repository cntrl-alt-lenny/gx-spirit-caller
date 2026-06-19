/* func_ov002_021deb20: `b & func_ov002_021de044(a, b, 0xe, 0x1000)`. */

extern int func_ov002_021de044(int a, int b, int c, int d);

int func_ov002_021deb20(int a, int b) {
    int r = func_ov002_021de044(a, b, 0xe, 0x1000);
    return b & r;
}
