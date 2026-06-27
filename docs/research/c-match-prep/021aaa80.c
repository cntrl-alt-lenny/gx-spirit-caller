/* CAMPAIGN-PREP candidate for func_021aaa80 (ov020, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: bind r4 base, store-order clamps, if-assign min, inline mul
 *   risk:       func_020b3870 returns in r0 but orig consumes its result via add r5/lsl chains; if mwcc schedules the post-bl mov differently the rotation diverges. permuter-class.
 *   confidence: low
 */
/* func_ov020_021aaa80: per-entry window animator. Decrement-clamp a timer,
 * lerp a base offset via func_020b3870, pack into the 0x04000018 window MMIO,
 * then either fade-in (func_020944a4) or run a second 0x8c0 timer + func_ov020_021add24.
 * (ov020) class C: hold r4 base across all uses, store-order on the clamps. */
extern int data_ov020_021ae060;
extern int data_ov020_021ae0a8;
extern int func_020944a4(void *dst, int src, int n);
extern int func_020b3870(int a, int b);
extern void func_ov020_021add24(void *dst, int src, int mode);

void func_ov020_021aaa80(int idx) {
    int base = idx * 0x28 + 0x18;
    char *g = (char *)&data_ov020_021ae0a8;
    if (*(int *)((char *)&data_ov020_021ae060 + 0x8d0) > 0) {
        int d = (*(int *)(g + 0x89c) - idx) * 0x28;
        int t = *(int *)(g + 0x88c) - 0x1000;
        int v;
        *(int *)(g + 0x88c) = t;
        if (t < 0) {
            t = 0;
            *(int *)(g + 0x88c) = 0;
        }
        t = *(int *)(g + 0x88c);
        v = func_020b3870(d * t, *(int *)(g + 0x888));
        base += v;
        if (t == 0)
            *(int *)(g + 0x888) = 0;
    }
    *(volatile int *)0x04000018 = (0x01ff0000 & (-base << 0x10)) | 0x1fc;
    if ((*(unsigned int *)(g + 0xa50) << 0x17) >> 0x1f) {
        int t = *(int *)(g + 0x8c0) - 0x1000;
        int v;
        *(int *)(g + 0x8c0) = t;
        if (t < 0)
            *(int *)(g + 0x8c0) = *(int *)(g + 0x8c4);
        v = func_020b3870(*(int *)(g + 0x8c0) * 0x168, *(int *)(g + 0x8c4));
        v = (unsigned short)v;
        func_ov020_021add24(g + 0x8a0, 0x05000180, (v << 0x10) | 0x10);
    } else {
        func_020944a4(g + 0x8a0, 0x05000180, 0x20);
    }
}
