/* func_ov021_021abc98: draw the centred caption — clear its 0xc00-byte cell
 * block, measure glyph 0x30d, right-align it within 0xdc px (clamped at 0), route
 * the active channel, and blit it. Returns 1. (ov021_core.h) */
extern int  func_0208dd04(void);
extern void func_02094410(int, int, int);
extern int  func_0202c06c(int);
extern void func_020a9698(void *, void *, int, int);
extern int  func_02005488(int, int);
extern void func_02001cec(void *, int, int);
extern void func_02001d48(int);
extern void func_02004f3c(void *, void *, int, int, int, int);
extern char data_ov021_021acd8c[];
extern struct { int w0; unsigned chan : 3; } data_02104e6c;
int func_ov021_021abc98(void *o) {
    int base = func_0208dd04();
    int glyph, x;
    char layout[0x20];
    func_02094410(0, base + 0x8a0, 0xc00);
    glyph = func_0202c06c(0x30d);
    func_020a9698(layout, data_ov021_021acd8c, glyph, *(int *)((char *)o + 0x4c));
    x = 0xdc - func_02005488(glyph, 0xc);
    if (x < 0)
        x = 0;
    func_02001cec((char *)o + 0x4, 0x20, 3);
    func_02001d48(data_02104e6c.chan);
    func_02004f3c((char *)o + 0x4, layout, base + 0x8a0, x, 6, 0xc);
    return 1;
}
