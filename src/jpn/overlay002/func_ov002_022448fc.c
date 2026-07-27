/* func_ov002_022448fc: per-player table lookup guard; if the entry is
 * zero, re-derive the two cd3f4 fields fresh (may have been mutated by
 * the intervening calls) and fire two more sinks. Always returns 1. */
extern char data_ov002_022cd314[];
extern char data_ov002_022cf0c4[];
#define CD3F4_I(off) (*(int *)(data_ov002_022cd314 + (off)))

extern void func_ov002_021d6624(int a, int b, int c);
extern void func_ov002_021e2a2c(int a);

int func_ov002_022448fc(void) {
    int idx = (CD3F4_I(0x4) & 1) * 0x868;
    int stride = CD3F4_I(0x20) * 20;
    if (*(unsigned short *)(data_ov002_022cf0c4 + idx + stride) == 0) {
        func_ov002_021d6624(CD3F4_I(0x4), CD3F4_I(0x20), 1);
        func_ov002_021e2a2c(30);
        func_ov002_021d6624(CD3F4_I(0x4), CD3F4_I(0x20), 0);
    }
    return 1;
}
