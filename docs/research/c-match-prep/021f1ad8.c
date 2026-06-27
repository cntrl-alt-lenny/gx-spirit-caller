/* CAMPAIGN-PREP candidate for func_021f1ad8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hold r4(call result) + ip(parity*0x868) across; mul not mla here; two tables share offset
 *   risk:       orig keeps ip=parity*0x868 and r3=slot*0x14 live across both table loads (add r1,base,ip / ldrh [r3,r1]); mwcc may recompute per-table. reshape-able: lift off_parity/off_slot as shown
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf1a4[];
extern u8 data_ov002_022cf1ac[];
extern int func_0202e234(int x);
extern int func_020310d8(int x);
extern int func_ov002_021b9e00(int p, int s);
extern int func_ov002_021b9ecc(int p, int s);

int func_ov002_021f1ad8(int p, int s)
{
    int r4;
    int off_parity;
    int off_slot;
    int t5;

    r4 = func_ov002_021b9ecc(p, s);
    if (r4 == 0)
        return 0;
    off_parity = (p & 1) * 0x868;
    off_slot = s * 0x14;
    if (*(u16 *)(&data_ov002_022cf1a4[off_slot + off_parity]) == 0)
        return 0;
    if ((*(u32 *)(&data_ov002_022cf1ac[off_slot + off_parity]) >> 6) & 1)
        return 0;
    if (func_0202e234(p) != 0) {
        if (s >= 5)
            return 0;
    } else {
        if (func_0202e234(r4) == 0) {
            if (s < 5)
                return 0;
        }
    }
    t5 = func_ov002_021b9e00(p, s);
    if (t5 < func_020310d8(r4))
        return 1;
    return 0;
}
