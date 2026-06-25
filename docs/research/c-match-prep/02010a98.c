/* CAMPAIGN-PREP candidate for func_02010a98 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: mla idx*0x18 inline, 16-bit wrap via (u16)(idx+1), movcs reset, reload f42
 *   risk:       wrap uses lsl#0x10;lsr#0x10 (u16 truncate) and movcs(>=0x100) resets to a held zero reg (ip); reloads limit f42 each iter. if mwcc keeps idx in 32-bit or hoists the limit load, the cmp/wrap diverges. reshape-able via u16 + per-iter reload
 *   confidence: low
 */
/* func_02010a98 (main, class C) — table scan with mla index + 16-bit wrap counter.
 * A=data_0218fcc8 (head: cur idx @+0x40, limit @+0x42). T=data_0218cbc8.
 * tbl base = T+0x1940 (stride 0x18). lim2 ptr = T+0x3100, reads f42.
 * Loop: e=base+idx*0x18; if e->f8==arg0 clear it; idx=(idx+1)&0xffff wrap;
 * if idx>=0x100 idx=0; until idx==lim2. Returns 1. */

typedef struct { int pad0[2]; int f8; } Ent;  /* f8 @ 0x8, stride 0x18 */

extern char data_0218fcc8;  /* A */
extern char data_0218cbc8;  /* T */

int func_02010a98(int target)
{
    char *A = &data_0218fcc8;
    char *T = &data_0218cbc8;
    unsigned short idx = *(unsigned short *)(A + 0x40);
    unsigned short first = *(unsigned short *)(A + 0x42);
    if (idx != first) {
        char *base = T + 0x1940;
        char *lim  = T + 0x3100;
        unsigned short zero = 0;
        do {
            Ent *e = (Ent *)(base + idx * 0x18);
            if (e->f8 == target) e->f8 = 0;
            idx = (unsigned short)(idx + 1);
            if (idx >= 0x100) idx = zero;
        } while (idx != *(unsigned short *)(lim + 0x42));
    }
    return 1;
}
