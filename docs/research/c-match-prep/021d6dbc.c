/* CAMPAIGN-PREP candidate for func_021d6dbc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed hi-byte (arg0>>8)&0xff; (u16)v>>8 split; byte-repack lo|(hi<<8)
 *   risk:       reshape-able (byte-pack peephole): the arg0 repack (arg0&0xff)|((arg0>>8&0xff)<<8) and the (u16)v hi-byte split risk mwcc's lsl#24;lsr#16 vs orig and;orr,lsl#8 -- retry with the (u8)lo|((u8)hi<<8) cast lever (core.h brief 358).
 *   confidence: med
 */
/* func_ov002_021d6dbc (ov002, cls D): byte-unpack arg0 (lo=player, hi=row),
 * guard (cf1a4 u16 nonzero, 021b9ecc==0x14ac, 021b3618!=0xffff) then arg-pack
 * into 021d5ab4 with the 021b3618 result split into lo/hi bytes and arg0's two
 * bytes repacked. Referenced by 021d7054 as func_021d6dbc(int,int). */
#include "ov002_core.h"

extern int  func_ov002_021b3618(int a, int b);
extern int  func_ov002_021b9ecc(int a, int b);
extern void func_ov002_021d5ab4(int a, int b, int c, int d);

int func_ov002_021d6dbc(int arg0, int arg1) {
    int lo = arg0 & 0xff;
    int hi = (arg0 >> 8) & 0xff;
    int v;
    if (lo == (arg1 & 0xff))
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + (lo & 1) * 0x868 + hi * 0x14) == 0)
        return 0;
    if (func_ov002_021b9ecc(lo, hi) != 0x14ac)
        return 0;
    v = func_ov002_021b3618(lo, hi);
    if (v == 0xffff)
        return 0;
    func_ov002_021d5ab4(v & 0xff,
                        ((unsigned short)v) >> 8,
                        (u16)((arg0 & 0xff) | (((arg0 >> 8) & 0xff) << 8)),
                        1);
    return 0;
}
