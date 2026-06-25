/* CAMPAIGN-PREP candidate for func_020358cc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order r0(sel),r2(v),r3(lim),r1(cur); mvn=-1 default; asr via signed >>; if-chain
 *   risk:       reshape-able: orig loads sel into r0 BEFORE deref *p60 (r1) and computes lim with mvn default; if mwcc reorders the *p60 load or picks ternary it may emit movcc instead of the b73-guarded mov sequence. Swap decl-order / keep if-else-if to fix.
 *   confidence: med
 */
extern void func_02038168(void *obj, int kind);

typedef struct {
    char pad60[0x60];
    int *p60;        /* +0x60 */
    short h64;        /* +0x64 */
    short h66;        /* +0x66 */
    char pad68[0x73 - 0x68];
    signed char b73;  /* +0x73 */
} Obj358cc;

void func_020358cc(Obj358cc *o) {
    int sel;
    int v;     /* r2: (s16)h64 then asr */
    int lim;   /* r3 */
    int cur;   /* r1: (s16)*p60 */
    if (o->b73 != 1) return;
    sel = o->h66;
    v = o->h64;
    cur = *(short *)o->p60;
    lim = -1;
    if (sel == 0) { v >>= 1; lim = 0x20; }
    else if (sel == 1) { v >>= 2; lim = 0x30; }
    else if (sel == 2) { v >>= 3; lim = 0x40; }
    if (lim < 0) return;
    if (cur > v) return;
    func_02038168(o, lim + 0x100);
    o->h66 = o->h66 + 1;
}
