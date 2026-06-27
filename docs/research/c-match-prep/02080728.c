/* CAMPAIGN-PREP candidate for func_02080728 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: clz log2 (31-clz capped 3); table data_020beedc[hl*8][wl*2]; pack 2 bytes into a word; stack-arg marshal
 *   risk:       permuter-class/intrinsic-guessed: mwcc 2.0 emits clz only from the right idiom — 31-__builtin_clz may not lower to clzlt;rsblt. The sp+0x14 byte-pack via union and 6-word spill order is also fragile.
 *   confidence: low
 */
/* func_02080728: compute floor(log2) (capped 3) of w(arg2) and h(arg3) via clz,
 * index a 2D table data_020beedc[h_log][w_log] yielding two bytes, then marshal a
 * 6-word arg block (5th arg from caller stack at sp+0x28) and call func_020808b8. */
extern unsigned char data_020beedc[];
extern void func_02080d38(void);
extern void func_02080cdc(void);
extern void func_020808f0(void);
extern void func_020808b8(int *dst, void *a, void *b, int w, int h,
                          void *fa, void *fb, void *fc, int packed);

static int log2c(int v) {
    int r;
    if (v < 8) { r = 31 - __builtin_clz(v); } else { r = 3; }
    return r;
}

void func_02080728(int *dst, void *a, int w, int h, void *b) {
    int wl = log2c(w);
    int hl = log2c(h);
    unsigned char *row = data_020beedc + (hl << 3);
    unsigned char b0 = row[wl << 1];
    unsigned char b1 = row[(wl << 1) + 1];
    union { unsigned char c[4]; int i; } pk;
    pk.c[0] = b0;
    pk.c[1] = b1;
    func_020808b8(dst, a, b, w, h,
                  (void *)func_02080d38, (void *)func_02080cdc,
                  (void *)func_020808f0, pk.i);
}
