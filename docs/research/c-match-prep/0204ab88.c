/* CAMPAIGN-PREP candidate for func_0204ab88 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch-returns-const-pairs->dense 0..4 branch table; mvn=~imm; return arg
 *   risk:       Dense table needs span 0..4 (cmp #4); without case 0 mwcc emits cmp #3. Default >4 reuses stale a/b — uninit-local default may not reproduce. reshape-able.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0204ab88 (main, class D, MED tier) — brief 497.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch-returns-constant-pairs -> dense 0..4 branch table; mvn = ~imm; ret arg
 *   risk:       dense jump table needs span 0..4 -> case 0 must exist or mwcc emits cmp #3 not #4; default(>4) reuses STALE a/b (orig has no setup on .L_6f4 entry), uninit-local default may not reproduce. reshape-able (force case 0; keep a/b as one mvn+add).
 *   confidence: med
 */
/* func_0204ab88 — main, cls D. movs r4,r0; if 0 return 0. switch(x) sets a (r0:
   9 or 6) and b (r2 via mvn = ~imm), then calls func_02050054(a, b+0xfffec398)
   and RETURNS the original arg x. Early x==0 return removes case 0 at runtime,
   but the jump table still spans 0..4 (cmp #4), so case 0 is written to keep the
   table dense. The b .L_6f4 right after addls is the >4 default (stale a/b). */
extern void func_02050054(int code, int packed);

int func_0204ab88(int x)
{
    int a, b;

    if (x == 0)
        return 0;

    switch (x) {
    case 1:  a = 9; b = ~0x0;  break;   /* .L_6c8 */
    case 2:  a = 9; b = ~0x1;  break;   /* .L_6d4 */
    case 3:  a = 6; b = ~0x9;  break;   /* .L_6e0 */
    case 4:  a = 6; b = ~0x13; break;   /* .L_6ec */
    case 0:                              /* .L_6f4 — table slot 0, runtime-dead */
    default: break;                      /* .L_6f4 — stale a/b */
    }

    func_02050054(a, b + (int)0xfffec398);
    return x;
}
