/* CAMPAIGN-PREP candidate for func_02061fa4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: take &a0 to force {r0-r3} spill+sp+8 ctx; guard state==7; two dispatch calls.
 *   risk:       struct-guessed: relies on &a0 (param address-taken) to reproduce stmdb {r0-r3} home area and ctx=sp+8; if mwcc spills differently the stack frame and bxeq epilogue diverge. sub[3]/sub[4] offsets inferred.
 *   confidence: low
 */
/* func_02061fa4 — early-out guard + state set + two dispatch calls (class D).
 * Args spilled via stmdb {r0-r3}; a second arg (&a0 home area, sp+8) is passed
 * to both callees. a0 is a struct*: field +0xc is a state guarded against 7;
 * field +0x8 is a sub-object whose +0xc / +0x10 ints select the dispatch.
 */
typedef struct {
    char _pad0[8];
    int  *sub;   /* +0x8 -> object; we read sub[3] (+0xc) and sub[4] (+0x10) */
    int   state; /* +0xc */
} Obj;

extern void func_020544c8(int sel, void *ctx);
extern void func_0205407c(int sel, void *ctx);

void func_02061fa4(Obj *a0, int a1, int a2, int a3)
{
    if (a0->state == 7)
        return;
    a0->state = 7;

    func_020544c8(a0->sub[3], &a0);   /* sub+0xc, ctx = &saved-args block */
    func_0205407c(a0->sub[4], &a0);   /* sub+0x10                         */
}
