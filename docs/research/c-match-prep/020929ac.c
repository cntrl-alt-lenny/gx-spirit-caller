/* CAMPAIGN-PREP candidate for func_020929ac (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: bind mask ~(size-1) reused twice; aligned in r4 returned; unsigned cmp for addhi
 *   risk:       the shared mvn mask (r2=~(size-1)) must CSE across both ANDs; if mwcc rematerialises mvn per use, 1 extra insn. reshape-able (hoist mask to a named local).
 *   confidence: med
 */
// func_020929ac — align-up + bounds-check allocator carve
// r7=p(param0,held); r6=ofs(param1); r5=size(param2 then reused); mask=~(size-1) held in r2

extern int  func_02092c78(void *p);  // returns current base ptr (int)
extern int  func_02092c8c(void *p);  // returns limit (int)
extern int  func_02092a34(void *p, int end);

int func_020929ac(void *p, int ofs, int size) {
    int base;
    int aligned;
    int end;

    base = func_02092c78(p);
    if (base == 0)
        return 0;
    aligned = (base + size - 1) & ~(size - 1);
    end = (aligned + ofs + size - 1) & ~(size - 1);
    if (end > (unsigned int)func_02092c8c(p))
        return 0;
    func_02092a34(p, end);
    return aligned;
}
