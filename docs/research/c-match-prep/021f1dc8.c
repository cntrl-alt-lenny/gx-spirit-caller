/* CAMPAIGN-PREP candidate for func_021f1dc8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     explicit DOUBLE-read of field (re-deref, not bound) = the base-reload lever; a4 table; dual-bitfield; 2 calls
 *   risk:       orig holds a,p,s and base+off_parity in callee regs across both calls (caller-saved spill pattern); mwcc reg-alloc across the call chain may rotate which callee reg holds each. permuter-class; double-read is reshape-able
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(void);
extern int func_ov002_021c2084(void *a, int p, int s, int f);

int func_ov002_021f1dc8(void *a, int p, int s)
{
    int off_parity;
    int off_slot;
    u32 v;
    u16 h;

    off_parity = (p & 1) * 0x868;
    off_slot = s * 0x14;
    if (((*(u32 *)(&data_ov002_022cf16c[off_parity + off_slot + 0x30]) << 0x13) >> 0x13) == 0)
        return 0;
    if (*(u16 *)(&data_ov002_022cf1a4[off_parity + off_slot]) != 0)
        return 0;
    v = *(u32 *)(&data_ov002_022cf16c[off_parity + off_slot + 0x30]);
    h = ((u16 *)a)[2];
    if ((((v << 2) >> 0x18) << 1) + ((v << 0x12) >> 0x1f) == ((u32)(h << 0x11) >> 0x17))
        return 0;
    if (func_ov002_021c1ef0() == 0)
        return 0;
    if (func_ov002_021c2084(a, p, s, 1) != 0)
        return 1;
    return 0;
}
