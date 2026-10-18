typedef unsigned int u32;
extern u32 *func_02018b94();

void func_ov011_021cf2fc(u32 a, u32 b, u32 c) {
    u32 *p;
    p = func_02018b94();
    p[5] = (p[5] & ~0xffu) | (a & 0xff);
    p = func_02018b94();
    p[7] = (p[7] & ~0x1f0000u) | ((b << 27) >> 11);
    p = func_02018b94();
    p[7] = (p[7] & ~0xff00u) | ((c << 24) >> 16);
}
