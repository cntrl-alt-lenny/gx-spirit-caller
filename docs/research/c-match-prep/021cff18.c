/* CAMPAIGN-PREP candidate for func_021cff18 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: asymmetric slot-word shift extracts (won't fold) + (u8) byte-packs + busy-gate; bp/bh/c held across both arms
 *   risk:       permuter-class: arg3 = ((slot<<2)>>24<<1)+((slot<<18)>>31) plus the (idx&1) byte-pack span the whole reg allocation across the 0x22 call; a reg rotation is likely. Asymmetric shifts themselves are safe.
 *   confidence: med
 */
/* func_ov002_021cff18 (cls D): busy-gated; build/post a 0x22 command from the
 * slot word + packed self bytes, or run the busy path (021b1f20 + 0x24). */
typedef unsigned char  u8;
typedef unsigned short u16;
extern char data_ov002_022ce950[];
extern char data_ov002_022cf16c[];
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int  func_ov002_0229c7f8(int cmd);
extern void func_ov002_021b1f20(int a, int b, int c, int d, int e);

void func_ov002_021cff18(void) {
    int idx = *(u16 *)(data_ov002_022ce950 + 2);
    int b   = *(u16 *)(data_ov002_022ce950 + 4);
    int busy = *(int *)(data_ov002_022ce950 + 0x810);
    int row = idx >> 8;
    int bp  = b & 1;
    int bh  = b >> 8;
    int c   = *(u16 *)(data_ov002_022ce950 + 6);
    if (busy == 0) {
        char *base = data_ov002_022cf16c + (idx & 1) * 0x868;
        int slot;
        *(int *)(data_ov002_022ce950 + 0x810) = busy + 1;
        slot = *(int *)(base + 0x30 + row * 20);
        func_ov002_0229ade0(0x22,
            (u16)(((u8)(idx & 1)) | ((u8)row << 8)),
            (u16)(((u8)bp) | ((u8)bh << 8)),
            (((unsigned)(slot << 2) >> 24) << 1) + ((unsigned)(slot << 18) >> 31));
        return;
    }
    if (func_ov002_0229c7f8(0x22) != 0)
        return;
    func_ov002_021b1f20(bp, bh, c, *(u16 *)(data_ov002_022ce950 + 2), 0);
    func_ov002_0229ade0(0x24, 0, 0, 0);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
