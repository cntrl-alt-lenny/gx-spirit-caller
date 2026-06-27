/* CAMPAIGN-PREP candidate for func_021d144c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: parity-mul (flag&1)*0x868 cf288 index; value-temp form so addr+read recompute per arm but store once; do NOT bind the pointer
 *   risk:       reshape-able: addr-recompute vs hoist. Orig recomputes (mul;ldr cf288;ldr) in BOTH arms but stores once; if mwcc CSE-hoists the unbound address into one reg, the per-arm recompute diverges. Try bound-p variant if so.
 *   confidence: med
 */
/* func_ov002_021d144c (cls D): parity-mul index into cf288, set/clear bit
 * (idx) of that word per the @+4 selector, post 0x24, clear ce950+0x80c.
 * Single merged store => value-temp form. */
typedef unsigned short u16;
extern char data_ov002_022ce950[];
extern char data_ov002_022cf288[];
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);

void func_ov002_021d144c(void) {
    int flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    int sel = *(u16 *)(data_ov002_022ce950 + 4);
    int bit = *(u16 *)(data_ov002_022ce950 + 2);
    int v;
    if (sel != 0)
        v = *(int *)((char *)data_ov002_022cf288 + (flag & 1) * 0x868) | (1 << bit);
    else
        v = *(int *)((char *)data_ov002_022cf288 + (flag & 1) * 0x868) & ~(1 << bit);
    *(int *)((char *)data_ov002_022cf288 + (flag & 1) * 0x868) = v;
    func_ov002_0229ade0(0x24, 0, 0, 0);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
