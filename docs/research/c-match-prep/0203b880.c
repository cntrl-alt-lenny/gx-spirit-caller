/* CAMPAIGN-PREP candidate for func_0203b880 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign min/best for movlt pair; bind base(r6)+0x5b48(r8) literals
 *   risk:       reshape-able: cost mul chain. Orig is `mul r2,v,h; mul r1,r2,h2` (v first); if mwcc reorders the 2 muls or the 0x5b48 lands as movw instead of a held literal in r8, fix operand order / introduce a held const local.
 *   confidence: med
 */
/* func_0203b880: argmin over 8 entries (stride 0xc4) of a cost score.
 * base = data_0219d388. For each with halfword[+0xb0] bit 0x8000:
 * v = func_0203b830(e); if bit 0x2000 -> cost = v*0x5b48; else
 * cost = v * halfword[+0xb2] * halfword[ e[+0x74] + 0x1e ]. Track signed
 * min (init 0x10000000) and best ptr (init NULL). Returns best. */

extern int func_0203b830(void *e);
extern char data_0219d388[];

typedef struct Ent_0203b880 {
    char           _pad0[0x74];
    unsigned char *f_74;         /* +0x74 */
    char           _pad1[0x38];  /* 0x78..0xb0 */
    unsigned short f_b0;         /* +0xb0, flags */
    unsigned short f_b2;         /* +0xb2 */
} Ent_0203b880;

void *func_0203b880(void) {
    void *best = 0;
    Ent_0203b880 *e = (Ent_0203b880 *)data_0219d388;
    int i = 0;
    int min = 0x10000000;
    do {
        if (e->f_b0 & 0x8000) {
            int v = func_0203b830(e);
            int cost;
            if (e->f_b0 & 0x2000) {
                cost = v * 0x5b48;
            } else {
                cost = v * e->f_b2 * *(unsigned short *)(e->f_74 + 0x1e);
            }
            if (cost < min) {
                min = cost;
                best = e;
            }
        }
        i++;
        e = (Ent_0203b880 *)((char *)e + 0xc4);
    } while (i < 8);
    return best;
}
