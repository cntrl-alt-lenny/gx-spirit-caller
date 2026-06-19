/* func_ov021_021aad88: draw one segment row — clear the row's 0x780-byte cell
 * strip (row = col % 16), and if the column maps to a live entry, look up its
 * glyph (table chosen by the global +0x34 flag), centre it about x=0x78 (clamped
 * at 1), and blit it at the row origin. Returns 1. (ov021_core.h) */
extern int  func_0208dcb4(void);
extern void func_02001cec(void *, int, int);
extern void func_02001d48(int);
extern void func_02094410(int, int, int);
extern int  func_02005488(int, int);
extern void func_0200506c(void *, int, int, int, int, int);
extern int  data_ov021_021aca40[];
extern char data_02103fcc[];
extern int  data_ov021_021ac900[];
extern int  data_ov021_021ac7c0[];
int func_ov021_021aad88(void *o, int col, int idx) {
    int row = col % 16;
    int base = func_0208dcb4() + 0x40;
    func_02001cec((char *)o + 0x4, 0x1e, 0x20);
    func_02001d48(0);
    func_02094410(0, base + row * 0x780, 0x780);
    if (idx < 0)
        return 1;
    {
        int e = data_ov021_021aca40[idx];
        int glyph, x;
        if (e < 0)
            return 1;
        glyph = (*(int *)(data_02103fcc + 0x34) == 0 ? data_ov021_021ac900
                                                      : data_ov021_021ac7c0)[e];
        x = 0x78 - func_02005488(glyph, 0xc) / 2;
        if (x < 1)
            x = 1;
        func_0200506c((char *)o + 0x4, glyph, base, x, row * 16 + 1, 0xc);
        return 1;
    }
}
