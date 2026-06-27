/* CAMPAIGN-PREP candidate for func_0200c74c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     shifted-mask set/clear; negative-idx mvn/mov as ?-1:0; field at 0x78
 *   risk:       reshape-able: the value?-1:0 may emit mov/mov instead of asm mvnne/moveq; if so write `if(value)f=-1;else f=0;` if-assign form
 *   confidence: high
 */
/* func_0200c74c @ 0x0200c74c (main, class D)
 * bit set/clear clone, field at offset 0x78.
 * r0 = obj, r1 = bit index (signed), r2 = value (set vs clear). returns 1.
 *
 *   if (idx < 0)  field = value ? -1 : 0;
 *   else if (value) field |=  (1u << idx);
 *   else            field &= ~(1u << idx);
 *   return 1;
 *
 * asm: negative-idx path uses mvnne/moveq (-1/0) BEFORE the set/clear path.
 * The set path: orr r3, r2(=1), lsl r1   -> field | (1<<idx)
 * The clr path: mvn r1, r2(=1) lsl r1; and -> field & ~(1<<idx)
 */

struct Obj0200c74c {
    char _pad[0x78];
    unsigned int flags;   /* 0x78 */
};

int func_0200c74c(struct Obj0200c74c *obj, int idx, int value)
{
    if (idx < 0) {
        obj->flags = value ? (unsigned int)-1 : 0u;
    } else if (value) {
        obj->flags = obj->flags | (1u << idx);
    } else {
        obj->flags = obj->flags & ~(1u << idx);
    }
    return 1;
}
