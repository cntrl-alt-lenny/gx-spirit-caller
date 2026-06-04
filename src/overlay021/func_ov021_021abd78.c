/* func_ov021_021abd78: draw the centred caption — clear its 0xc00-byte cell
 * block, measure glyph 0x30d, right-align it within 0xdc px (clamped at 0), route
 * the active channel, and blit it. Returns 1. (ov021_core.h) */
extern int  func_0208ddec(void);
extern void func_02094504(int, int, int);
extern int  func_0202c0c0(int);
extern void func_020a978c(void *, void *, int, int);
extern int  func_020054a4(int, int);
extern void func_02001d0c(void *, int, int);
extern void func_02001d68(int);
extern void func_02004f58(void *, void *, int, int, int, int);
extern char data_ov021_021ace6c[];
extern struct { int w0; unsigned chan : 3; } data_02104f4c;
int func_ov021_021abd78(void *o) {
    int base = func_0208ddec();
    int glyph, x;
    char layout[0x20];
    func_02094504(0, base + 0x8a0, 0xc00);
    glyph = func_0202c0c0(0x30d);
    func_020a978c(layout, data_ov021_021ace6c, glyph, *(int *)((char *)o + 0x4c));
    x = 0xdc - func_020054a4(glyph, 0xc);
    if (x < 0)
        x = 0;
    func_02001d0c((char *)o + 0x4, 0x20, 3);
    func_02001d68(data_02104f4c.chan);
    func_02004f58((char *)o + 0x4, layout, base + 0x8a0, x, 6, 0xc);
    return 1;
}
