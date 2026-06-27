/* CAMPAIGN-PREP candidate for func_022177d4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two guards; mla (lo&1)*0x868 base; smulbb byte1*20 u16 index gate
 *   risk:       same as 02217098: byte1*20 must emit smulbb not mul (reshape-able via &0xff mask), and 021d63fc r1/r2 are leftover-reg reuse. struct-guessed (cf1a4 base, slot+0 u16).
 *   confidence: low
 */
/* func_ov002_022177d4 (ov002, class D) — bit2 guard + 021bb068 guard,
 * 0223df38 out-param, mla per-player base + smulbb 20-byte index, gated sink. */
#include "ov002_core.h"
extern int  func_ov002_021bb068(int a);
extern int  func_ov002_021d63fc(void *self, int a, int b, int c);
extern int  func_ov002_0223df38(void *a, int b, int *out);

struct Self022177d4 {
    u16 f0;            /* +0 */
    u16 b0  : 1;       /* +2 bit0 */
    u16 _p2 : 15;
    u16 _p4a : 2;      /* +4 bits[1:0] */
    u16 b2  : 1;       /* +4 bit2 */
    u16 _p4b : 13;
};

int func_ov002_022177d4(struct Self022177d4 *arg0) {
    int out;
    int lo, byte1;
    char *base;
    if (arg0->b2 != 0) return 0;
    if (func_ov002_021bb068(0x135d) != 0) return 0;
    if (func_ov002_0223df38(arg0, 0, &out) == 0) return 0;
    lo = out & 0xff;
    byte1 = ((unsigned short)out >> 8) & 0xff;
    base = data_ov002_022cf1a4 + (lo & 1) * 0x868;
    if (*(unsigned short *)(base + byte1 * 20) == 0) return 0;
    func_ov002_021d63fc(arg0, lo, byte1, 0);
    return 0;
}
