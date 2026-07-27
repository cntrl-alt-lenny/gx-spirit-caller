/* func_ov002_022449e4: per-player table lookup guard; if the entry is
 * zero, re-derive the two cd3f4 fields fresh (may have been mutated by
 * the intervening calls) and fire two more sinks. Always returns 1. */
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cf1a4[];
#define CD3F4_I(off) (*(int *)(data_ov002_022cd3f4 + (off)))

extern void func_ov002_021d6714(int a, int b, int c);
extern void func_ov002_021e2b1c(int a);

int func_ov002_022449e4(void) {
    int idx = (CD3F4_I(0x4) & 1) * 0x868;
    int stride = CD3F4_I(0x20) * 20;
    if (*(unsigned short *)(data_ov002_022cf1a4 + idx + stride) == 0) {
        func_ov002_021d6714(CD3F4_I(0x4), CD3F4_I(0x20), 1);
        func_ov002_021e2b1c(30);
        func_ov002_021d6714(CD3F4_I(0x4), CD3F4_I(0x20), 0);
    }
    return 1;
}
