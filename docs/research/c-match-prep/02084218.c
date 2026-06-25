/* CAMPAIGN-PREP candidate for func_02084218 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     three guard bits, mla actor-row index, data_02102200[sel] dispatch, PC+=2
 *   risk:       struct-guessed: header field offsets (t+6, +hdr, +4) inferred; confirm row layout. mla (w*id + base) may split add/lsl if id not kept narrow (u8) - keep id as unsigned char.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02084218 (main, class C) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: three guard bits (0x200 / need 0x1 / not 0x2); mla table walk t+hdr; final dispatch via data_02102200[id]; s->0+=2
 */
/* func_02084218: guarded opcode dispatch. From script block s->dc, read a
 * header, index a per-actor row (mla by actor id at (*s)[1]), then call
 * handler data_02102200[secondHeaderWord]. Advance PC by 2. */

extern void *data_02102200[];

void func_02084218(unsigned char *s) {
    int flags = *(int *)(s + 8);
    if (!(flags & 0x200) && (flags & 0x1) && !(flags & 0x2)) {
        unsigned char *t = *(unsigned char **)(s + 0xdc);
        unsigned char *st = *(unsigned char **)s;
        unsigned int hdr = *(unsigned short *)(t + 6);
        unsigned char id = st[1];
        unsigned short w = *(unsigned short *)(t + hdr);
        int off2 = *(int *)((t + hdr) + w * id + 4);
        unsigned short sel = *(unsigned short *)(t + off2);
        void (*h)(void) = (void (*)(void))data_02102200[sel];
        h();
    }
    *(int *)s += 2;
}
