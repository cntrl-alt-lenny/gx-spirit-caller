/* CAMPAIGN-PREP candidate for func_0208d2bc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: addls-pc switch 0..12 over code; byte-flag stores + 0x4000 toggle; tail call
 *   risk:       struct-guessed: byte-flag global addrs (LIT1..5) absent from asm slice - placeholders; case->label fall-through grouping (4->3, 13->9) inferred from shared b .L_x targets. C switch vs addls-pc table layout may also differ. permuter-class+struct-guessed.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0208d2bc (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: D, branch-table (addls pc) state
 * setter writing audio/MMIO flag bytes, then tail-call func_0208dce4(state).
 * st = (struct@data_021a6304). On entry: oldState=st->h0 mask logic ->
 *   ip=~code; st->hc(new)=code; st->h0 = (st->h0 | st->hc_old) & ~code ... but
 * the halfword math is: tmp = st->h0 | st->hc; st->h0 = ~code & tmp; st->hc=code.
 * Then switch(code) 0..12 sets byte flags + toggles bit 0x4000 in a halfword
 * MMIO/global (data_LIT3). Finally arg = st->h0 (reloaded), tail func_0208dce4.
 * STRUCT/LIT GUESSED: only data_021a6304 (LIT0) is a known reloc target; the
 * other literal pools (LIT1..LIT5) are byte-flag globals whose addresses are
 * NOT in the asm slice (literal words elided) - placeholders below.
 */
extern unsigned short data_021a6304;        /* state struct: +0x0 mask, +0xc cur */
extern int func_0208dce4(int state);

/* placeholders - real addresses come from the function's literal pool */
extern unsigned char  data_flag_a;          /* LIT1 */
extern unsigned char  data_flag_b;          /* LIT2 */
extern unsigned short data_ctl_h;           /* LIT3 (bit 0x4000 toggled) */
extern unsigned char  data_flag_c;          /* LIT4 */
extern unsigned char  data_flag_d;          /* LIT5 */

int func_0208d2bc(int code)
{
    unsigned short *st = &data_021a6304;
    unsigned short m;

    m = (unsigned short)(st[0] | st[6]);          /* h0 | hc  (hc at +0xc = idx6) */
    st[6] = (unsigned short)code;                 /* store new state first */
    st[0] = (unsigned short)(~code & m);

    switch (code) {
    case 4:
        data_flag_a = 0x93;
        /* fallthrough */
    case 3:
        data_flag_b = 0x9b;
        data_ctl_h |= 0x4000;
        break;
    case 13:
        data_flag_c = 0x93;
        /* fallthrough */
    case 9:
        data_flag_d = 0x9b;
        data_ctl_h |= 0x4000;
        break;
    case 1:
        data_ctl_h &= ~0x4000;
        break;
    case 2:
        data_flag_a = 0x9b;
        data_ctl_h |= 0x4000;
        break;
    case 5:
        data_flag_c = 0x9b;
        data_ctl_h |= 0x4000;
        break;
    default:
        break;
    }
    return func_0208dce4(st[0]);
}
