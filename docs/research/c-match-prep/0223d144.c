/* CAMPAIGN-PREP candidate for func_0223d144 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two-arm bitfield guard; shared mul index r3 reused; bit0/5-bit field extracts raw
 *   risk:       reshape-able (value-map): the two `!=0?1:0` returns must be the if-assign form (mov#0/movne#1) not ternary to avoid moveq; r3 holds idx*1 (mul r3,r2,0x868) reused across both cf184/cf17c reads — bind idx once.
 *   confidence: med
 */
/* func_ov002_0223d144 (ov002, class D): branch on self->f2 bits[19:18]; arm0
 * (==0) gates via 021bc618 then two per-player count tables (cf184 nonzero AND
 * cf17c-derived nonzero -> 1); else dispatch 021b4098 with two extracted fields.
 * Two-arm guard, bitfield extracts, shared mul index r3. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern int  data_ov002_022cf17c[];
extern int  data_ov002_022cf184[];
extern int  func_ov002_021b4098(int a, int b);
extern int  func_ov002_021bc618(int a);

int func_ov002_0223d144(void *self) {
    u32 f2 = (u32)*(u16 *)((char *)self + 2);
    if (((f2 << 0x12) >> 0x1e) == 0) {
        int idx, w;
        if (func_ov002_021bc618((int)((f2 << 0x1f) >> 0x1f)) == 0) return 0;
        f2 = (u32)*(u16 *)((char *)self + 2);
        idx = ((int)((f2 << 0x1f) >> 0x1f) & 1) * 0x868;
        w = *(int *)((char *)data_ov002_022cf184 + idx);
        if (w == 0) return 0;
        return (*(int *)((char *)data_ov002_022cf17c + idx) != 0) ? 1 : 0;
    } else {
        int hw = (int)*(u16 *)self;
        (void)hw;
        return (func_ov002_021b4098((int)((f2 << 0x1f) >> 0x1f),
                                    (int)((f2 << 0x1a) >> 0x1b)) != 0) ? 1 : 0;
    }
}
