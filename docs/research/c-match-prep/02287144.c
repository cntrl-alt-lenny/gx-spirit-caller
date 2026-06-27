/* CAMPAIGN-PREP candidate for func_02287144 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 :1; rsb=1-bit0; short-circuit && (eq-chain); bgt ret0; movne => !=0
 *   risk:       reshape-able: orig holds the d016c base in r1 across both +0xcec and +0xcf8 loads (ldreq reuses r1). If mwcc reloads the base for the second field, 1 ldr diverges - bind `char *g = data_ov002_022d016c;` to one local to force base reuse.
 *   confidence: med
 */
/* func_ov002_02287144 (cls D): if (g[+0xcec]==(1-bit0) && g[+0xcf8]==0) { if 02280980()>0 ret0; return 021bc0d4(1-bit0,1,1)!=0; } else ret0.
 * rsb r2,r0,#1 => 1-bit0; cmp [+0xcec],r2; ldreq [+0xcf8]; cmpeq #0 => short-circuit &&; bne => ret0.
 * 02280980()>0 (bgt) -> ret0; else 021bc0d4(1-bit0,1,1); cmp#0/movne => !=0. */
typedef unsigned short u16;
struct S87144 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022d016c[];
extern int func_ov002_021bc0d4(unsigned int v, unsigned int k1, unsigned int k2);
extern int func_ov002_02280980(void);
int func_ov002_02287144(struct S87144 *self) {
    if (*(int *)(data_ov002_022d016c + 0xcec) == (int)(1 - self->bit0) &&
        *(int *)(data_ov002_022d016c + 0xcf8) == 0) {
        if (func_ov002_02280980() > 0) return 0;
        return func_ov002_021bc0d4(1 - self->bit0, 1, 1) != 0;
    }
    return 0;
}
