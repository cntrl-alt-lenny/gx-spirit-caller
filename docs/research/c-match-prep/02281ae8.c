/* CAMPAIGN-PREP candidate for func_02281ae8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     identical clone of 02281a74; only the callback ptr differs (&func_02281a28 here vs &02281a20)
 *   risk:       VERIFIED EXACT mwcc 2.0/sp1p5 (byte-identical modulo pool relocs; clone of 02281a74). Only divergence vector is the callback symbol in the pool. struct-guessed: arr120 offset shared with the clone.
 *   confidence: high
 */
typedef unsigned short u16;
struct ent { unsigned int f0 : 13; unsigned int _hi : 19; };
extern char data_ov002_022cf16c[];
extern int  func_ov002_0228d544(int self, void *cb, int a, int b);
extern int  func_ov002_0227c678(int self, int one, u16 field);
extern void func_ov002_02281a28(void);

int func_ov002_02281ae8(int arg0) {
    struct ent *arr;
    int idx;
    int r;
    idx = func_ov002_0228d544(arg0, (void *)func_ov002_02281a28, 1, 1);
    if (idx < 0)
        return 0;
    arr = (struct ent *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 + 0x120);
    r = func_ov002_0227c678(arg0, 1, (u16)arr[idx].f0);
    if (r == 0)
        return 1;
    return 0;
}
