typedef unsigned int u32;
extern void func_02093c20(u32 dmaNo, u32 src, u32 size, u32 dir);
extern void func_01ff86fc(u32 dmaNo, u32 src, u32 dest, u32 ctrl);
void func_02093fb8(u32 dmaNo, u32 src, u32 dest, u32 size) {
    u32 *cnt;
    if (size == 0) return;
    func_02093c20(dmaNo, src, size, 0);
    cnt = (u32 *)0x040000b0 + (dmaNo * 3 + 2);
    while (*(volatile u32 *)cnt & 0x80000000) {}
    func_01ff86fc(dmaNo, src, dest, (size >> 1) | 0x80000000);
    while (*(volatile u32 *)cnt & 0x80000000) {}
}

