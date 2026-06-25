/* CAMPAIGN-PREP candidate for func_021bbdc0 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind handle h across switch; branch-table all-cases-named; if-assign for ==1 selects
 *   risk:       reshape-able: h must stay live in r0 across the whole switch (orig keeps func_02021660 return in r0, no reload). If mwcc spills h, force ordering; case2 movne/moveq want ternary.
 *   confidence: med
 */
/* func_ov006_021bbdc0 — kick the target channel, then a branch-table on
 * self->mode picks a value 'v', post a config word (0x801) to the channel,
 * and forward (2, self->mode) and (3, v) to the message sink. ret 1. */
extern int  func_02021660(int a, int b, int c);
extern int  func_020216b0(int a, int b, int c);
extern void func_02022234(int a, int b);

typedef struct {
    int  f0;             /* 0x00 */
    char _pad4[0x3c];
    int  mode;           /* 0x40 */
    char _pad44[0xc];
    int  f50;            /* 0x50 */
    char _pad54[0x8];
    int  f5c;            /* 0x5c */
    char _pad60[0x14];
    int  f74;            /* 0x74 */
} Ov006BdcS;

int func_ov006_021bbdc0(Ov006BdcS *self) {
    int h = func_02021660(self->f0, 4, 0);
    int v;
    switch (self->mode) {
    case 1: case 4:
        v = self->f50;
        if (v == 4) v = self->f5c + 4;
        break;
    case 2:
        if (self->f74 == 0)
            v = (self->f50 == 1) ? 0 : 1;
        else
            v = (self->f50 == 1) ? 2 : 3;
        break;
    default:
        v = self->f50;
        break;
    }
    func_020216b0(h, 0, 0x801);
    func_02022234(2, self->mode);
    func_02022234(3, v);
    return 1;
}
