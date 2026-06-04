/* func_ov021_021aae68: draw one segment row — clear the row's 0x780-byte cell
 * strip (row = col % 16), and if the column maps to a live entry, look up its
 * glyph (table chosen by the global +0x34 flag), centre it about x=0x78 (clamped
 * at 1), and blit it at the row origin. Returns 1. (ov021_core.h) */
extern int  func_0208dd9c(void);
extern void func_02001d0c(void *, int, int);
extern void func_02001d68(int);
extern void func_02094504(int, int, int);
extern int  func_020054a4(int, int);
extern void func_02005088(void *, int, int, int, int, int);
extern int  data_ov021_021acb20[];
extern char data_021040ac[];
extern int  data_ov021_021ac9e0[];
extern int  data_ov021_021ac8a0[];
int func_ov021_021aae68(void *o, int col, int idx) {
    int row = col % 16;
    int base = func_0208dd9c() + 0x40;
    func_02001d0c((char *)o + 0x4, 0x1e, 0x20);
    func_02001d68(0);
    func_02094504(0, base + row * 0x780, 0x780);
    if (idx < 0)
        return 1;
    {
        int e = data_ov021_021acb20[idx];
        int glyph, x;
        if (e < 0)
            return 1;
        glyph = (*(int *)(data_021040ac + 0x34) == 0 ? data_ov021_021ac9e0
                                                      : data_ov021_021ac8a0)[e];
        x = 0x78 - func_020054a4(glyph, 0xc) / 2;
        if (x < 1)
            x = 1;
        func_02005088((char *)o + 0x4, glyph, base, x, row * 16 + 1, 0xc);
        return 1;
    }
}
