/* CAMPAIGN-PREP candidate for func_02295990 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D-bitfield :13 (deref of 021afb74) bound in callee r5; field0=*(u16*)p reloaded; && predicate
 *   risk:       final cond is ldrne/cmpne/movne/moveq compound; mwcc must keep x in r5 across 0202e270 and emit the ne-chained reload of field0. likely-ok but compound-predicate codegen is a coin-flip. permuter-class.
 *   confidence: med
 */
/* func_ov002_02295990: guard chain ending in a compound predicate.
 *   if 021bbf50(p->b0) < 2                  -> return 0
 *   if 022806a4(p->b0, *(u16*)p, 0) < 0     -> return 0
 *   x = (*021afb74()) :13 low bits          (held in callee r5)
 *   return 0202e270(x) != 0 && x != *(u16*)p
 * field0 (*(u16*)p) is loaded once for call 2 and reloaded for the final
 * compare (the call between clobbers it). */
extern int  func_0202e270(int x);
extern int *func_ov002_021afb74(void);
extern int  func_ov002_021bbf50(int v);
extern int  func_ov002_022806a4(int b0, int field0, int z);

struct Ov002Hdr1  { char _p2[2]; unsigned short b0 : 1; };
struct Ov002Low13 { unsigned int f0 : 13; };

int func_ov002_02295990(struct Ov002Hdr1 *p) {
    int x;

    if (func_ov002_021bbf50(p->b0) < 2)
        return 0;
    if (func_ov002_022806a4(p->b0, *(unsigned short *)p, 0) < 0)
        return 0;
    x = ((struct Ov002Low13 *)func_ov002_021afb74())->f0;
    return func_0202e270(x) != 0 && x != *(unsigned short *)p;
}
