/* func_ov003_021cccb4: load the cursor glyph for a slot — bail (0) if the slot is
 * already occupied; otherwise route the active channel, derive the palette code
 * from the live colour field (bits 30:25 of the page/state word, slot-selected),
 * and return the built glyph. (ov003_core.h) */
extern char data_02104b88[];
extern char data_02103fcc[];
extern void func_02001d48(int);
extern int  func_0202c06c(int);
extern struct { int w0; unsigned chan : 3; } data_02104e6c;
int func_ov003_021cccb4(int dummy, int slot) {
    int v;
    if (*(int *)(data_02104b88 + slot * 4) != 0)
        return 0;
    func_02001d48(data_02104e6c.chan);
    if (slot != 0)
        v = *(int *)(data_02103fcc + 0xba8);
    else
        v = *(int *)((char *)&data_02104e6c + 0xa64);
    return func_0202c06c(((v & 0x7e000000) >> 0x19) + 0x36c + 0x400);
}
