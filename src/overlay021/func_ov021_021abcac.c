/* func_ov021_021abcac: redraw the active cell — clear its 0x800-byte block, and
 * if the cell (row*5+col) is occupied and not currently masked, resolve its value
 * through the +0x60/+0x74 indirection (else 0); convert to a glyph, route the
 * active channel, and blit it. Returns 1. (ov021_core.h) */
extern int  func_0208ddec(void);
extern void func_02094504(int, int, int);
extern int  func_0202224c(int);
extern int  func_0202b100(int);
extern void func_02001d0c(void *, int, int);
extern void func_02001d68(int);
extern void func_02004f58(void *, int, int, int, int, int);
extern struct { int w0; unsigned chan : 3; } data_02104f4c;
int func_ov021_021abcac(void *o) {
    int base = func_0208ddec();
    int idx, v, glyph;
    func_02094504(0, base + 0xa0, 0x800);
    idx = *(int *)((char *)o + 0x44) + *(int *)((char *)o + 0x48) * 5;
    if (*(int *)((char *)o + 0x9c + idx * 4) != 0 && (func_0202224c(0) & 1) == 0)
        v = *(int *)((char *)o + 0x60 + *(int *)((char *)o + 0x74 + idx * 4) * 4);
    else
        v = 0;
    glyph = func_0202b100(v);
    func_02001d0c((char *)o + 0x4, 0x20, 2);
    func_02001d68(data_02104f4c.chan);
    func_02004f58((char *)o + 0x4, glyph, base + 0xa0, 2, 3, 0xc);
    return 1;
}
