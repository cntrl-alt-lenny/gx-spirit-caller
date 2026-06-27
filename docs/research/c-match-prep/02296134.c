/* CAMPAIGN-PREP candidate for func_02296134 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla base+f0*stride bind; field via <<0x13>>0x13; cmp<<1
 *   risk:       reshape-able: orig keeps r3=base in one reg for both [ip] and [r3,r0] uses; if mwcc reloads data_022cf16c the second time, an extra ldr diverges — bind `bank`/base to one local as written.
 *   confidence: med
 */
// func_ov002_02296134 — mla bank index, lsl#1 cmp predicate
typedef struct Obj Obj;
struct Obj { unsigned short pad0; unsigned short flags; };

extern int data_ov002_022cf16c[];   // stride 0x868; [+0xf8] field, [+0] field

int func_ov002_02296134(Obj *obj)
{
    int f0 = obj->flags & 1;
    char *bank = (char *)data_ov002_022cf16c + (f0 & 1) * 0x868;
    int v;

    v = *(int *)(bank + 0xf8);
    v = (v << 0x13) >> 0x13;             /* low 13-bit unsigned field */
    if ((unsigned)v != 0x175e)
        return 0;

    {
        int other = ((1 - f0) & 1) * 0x868;
        if (*(int *)bank >= (*(int *)((char *)data_ov002_022cf16c + other) << 1))
            return 1;
        return 0;
    }
}
