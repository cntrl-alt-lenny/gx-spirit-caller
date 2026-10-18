extern void func_ov002_0226acf8(int r0, int r1, unsigned short r2, unsigned short r3);

void func_ov002_0226ae50(int r0, int r1, int r2) {
    unsigned short flags = 0;
    if (r2 == 1) {
        flags |= 1;
    }
    if (r2 == 8) {
        flags |= 4;
    }
    if (r2 == 7) {
        flags |= 8;
    }
    flags |= 0x10;
    func_ov002_0226acf8(r0, 2, r1, flags);
}
