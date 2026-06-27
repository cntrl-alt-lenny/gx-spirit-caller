/* CAMPAIGN-PREP candidate for func_02201a6c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bitfield extracts; (bit23==0 && nib==0xe) &&-chain; halfword unpack lo/hi to func_021c93f0(a,k,idx); Entry low13/bit13
 *   risk:       permuter-class: the func_021b947c-result unpack uses lsl#0x10/lsr#0x10 then asr#8 (signed (short)>>8) on the low half; `(r>>8)&0xff` likely emits lsr;and not the lsl;lsr;asr trio - reg use before func_021c93f0 diverges. struct-guessed.
 *   confidence: low
 */
/* func_ov002_02201a6c (ov002, class D) - chained bitfield gates + halfword-unpacked calls.
 * word=+0x14: field4=bits[13:10], (bit23==0 && bits[22:19]==0xe) &&-gate, low9 -> func_021b947c.
 * func_021b947c returns a 32b value unpacked as (lo&0xff, (lo>>8)&0xff, hi) -> func_021c93f0(a,k,idx). */
extern int func_0202e234(int id);
extern int func_ov002_021b947c(int x);
extern unsigned char *func_ov002_021c93f0(int a, int k, int idx);

typedef struct {
    unsigned short id0;
    unsigned short cb0  : 1;
    unsigned short cf5  : 5;
    unsigned short kind : 6;
    unsigned short cf12 : 2;
    unsigned short cb14 : 1;
    unsigned short cb15 : 1;
    unsigned char pad4[0x10];
    unsigned int w_0_8   : 9;
    unsigned int w_b9    : 1;
    unsigned int w_10_13 : 4;
    unsigned int w_14_18 : 5;
    unsigned int w_19_22 : 4;
    unsigned int w_b23   : 1;
} Card;

typedef struct {
    unsigned int e_0_12 : 13;
    unsigned int e_b13  : 1;
} Entry;

int func_ov002_02201a6c(Card *c) {
    int kind = c->kind;
    int r, key;
    Entry *e;
    if (kind != 0x16 && kind != 0x1b) return 0;
    if (c->w_10_13 > 4) return 0;
    if (c->w_b23 != 0) return 0;
    if (c->w_19_22 != 0xe) return 0;
    r = func_ov002_021b947c(c->w_0_8);
    e = (Entry *)func_ov002_021c93f0(r & 0xff, (r >> 8) & 0xff, (r >> 16) & 0xffff);
    if (e->e_b13 != (unsigned int)c->cb0) return 0;
    key = e->e_0_12;
    return func_0202e234(key) != 0 ? 1 : 0;
}
