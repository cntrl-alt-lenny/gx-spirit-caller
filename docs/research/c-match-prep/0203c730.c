/* CAMPAIGN-PREP candidate for func_0203c730 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hold g(sl)+self(r9, via mla)+base5(r5)+n(r6)+self_idx(r7); u8 idx wrap & 0xff
 *   risk:       permuter-class: self ptr precomputed via `mla r9,idx,0xc0,base5` before the >=6 guard and kept in r9 across the call; mwcc may sink the mla past the early-return or recompute it per use, and i*0xc0 vs i<<2 indexing may re-derive.
 *   confidence: low
 */
/* func_0203c730: scan active members for a collision/match.
 * g = *data_0219d9b8 (held in sl). base5 = g + 0x474. self_idx r7 =
 * byte[g+0xd13]. self = base5 + self_idx*0xc0 (mla, held r9). If
 * byte[g+0xd0d] >= 6 return 1. n r6 = byte[g+0xd12]; if n==0 return 1.
 * For r8 = 0..n-1 (u8 wrap): skip r8==self_idx; skip if
 * byte[ g + r8*4 + 0x445 ] >= 6; else other = base5 + r8*0xc0;
 * tag = halfword[other+0x400+0x7a]; if func_020ab054(self, other, tag)==0
 * return 2. Loop end return 1. */

extern char *data_0219d9b8;
extern int func_020ab054(void *self, void *other, int tag);

int func_0203c730(void) {
    char *g = data_0219d9b8;
    char *base5 = g + 0x474;
    int self_idx = (unsigned char)g[0xd13];
    char *self = base5 + self_idx * 0xc0;
    int n;
    int i;
    if ((unsigned char)g[0xd0d] >= 6) return 1;
    n = (unsigned char)g[0xd12];
    if (n == 0) return 1;
    i = 0;
    do {
        if (i != self_idx) {
            if ((unsigned char)*(g + (i << 2) + 0x445) < 6) {
                char *other = base5 + i * 0xc0;
                int tag = *(unsigned short *)(other + 0x400 + 0x7a);
                if (func_020ab054(self, other, tag) == 0) return 2;
            }
        }
        i = (i + 1) & 0xff;
    } while (i < n);
    return 1;
}
