/* CAMPAIGN-PREP candidate for func_02231dec (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield decode; byte-split lo/hi; reload f2 for sp0/packed (orig re-ldrh); store-order
 *   risk:       struct-guessed: parity*0x868/slot*0x14/+0x30 strides inferred from offsets. Also 021d59cc carries a 6th-ish const (mov r3,#6) maybe sel arg, omitted -> reshape-able arg-order.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02231dec (ov002, class D) - brief 494.
 * UNVERIFIED build-free draft. Canonical f2/f4 bitfield decode + parity*0x868
 * record/guard tables, then guarded helper chain (df38 / de94 / 0225764c /
 * 021d59cc / 0226b11c). lo/hi byte-split of de94 return; sp0 = f2&1.
 */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];   /* record table, +0x30 */
extern char data_ov002_022cf1a4[];   /* guard table         */
extern void func_ov002_021d59cc(int lo, int hi, u16 packed, int sp0);
extern int  func_ov002_0223de94(char *obj, int b);
extern int  func_ov002_0223df38(int a, int b, int c);
extern int  func_ov002_0225764c(char *obj, int lo, int hi);
extern void func_ov002_0226b11c(int lo, int hi);

int func_ov002_02231dec(char *obj) {
    u16 f2 = *(u16 *)(obj + 2);
    u16 f4 = *(u16 *)(obj + 4);
    int parity = (f2 << 0x1f) >> 0x1f;
    int slot = (f2 << 0x1a) >> 0x1b;
    int rec = *(int *)(data_ov002_022cf16c + parity * 0x868 + 0x30 + slot * 0x14);
    int A = (f4 << 0x11) >> 0x17;
    int B = ((rec << 2) >> 0x18) * 2 + ((rec << 0x12) >> 0x1f);
    int lo, hi, kind, sp0;

    if (A != B)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + parity * 0x868 + slot * 0x14) == 0)
        return 0;
    if (func_ov002_0223df38(0, 0, 0) == 0)
        return 0;
    kind = func_ov002_0223de94(obj, 0);
    lo = kind & 0xff;
    hi = (kind >> 8) & 0xff;
    if (func_ov002_0225764c(obj, lo, hi) == 0)
        return 0;
    sp0 = (*(u16 *)(obj + 2) << 0x1f) >> 0x1f;
    {
        u16 g4 = *(u16 *)(obj + 2);
        u16 packed = (u16)((sp0 & 0xff) | (((g4 << 0x1a) >> 0x1b) << 8));
        func_ov002_021d59cc(lo, hi, packed, sp0);
    }
    func_ov002_0226b11c(lo, hi);
    return 0;
}
