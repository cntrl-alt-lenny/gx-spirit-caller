/* CAMPAIGN-PREP candidate for func_02296fa4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack pair out-param; notf0=1-f0; index table by notf0*stride; pair[notf0] via lr<<2
 *   risk:       struct-guessed + reshape-able: pair[notf0] uses `ldr [sp, lr, lsl#2]` so the stack array index reuses the SAME notf0 reg as the table parity — if mwcc recomputes the index the shared-reg `lr` reuse breaks; confirm 2-int stack slot.
 *   confidence: low
 */
// func_ov002_02296fa4 — stack out-param, bind-base index add, branch tail
typedef struct Obj Obj;
struct Obj { unsigned short pad0; unsigned short flags; };

extern void func_ov002_0220eb00(int *outPair);     /* fills sp[0..1] */
extern int  func_ov002_021bae7c(int flag, int b);
extern int  data_ov002_022cf16c[];   /* stride 0x868 */

int func_ov002_02296fa4(Obj *obj)
{
    int pair[2];
    int notf0, idx, v;

    func_ov002_0220eb00(pair);

    notf0 = 1 - (obj->flags & 1);          /* lr */
    idx = (notf0 & 1) * 0x868;             /* ip */
    v = *(int *)((char *)data_ov002_022cf16c + idx) + pair[notf0];
    if (v <= 0)
        return 1;

    if (func_ov002_021bae7c(0x1964, -1) != 0)
        return 1;

    if (func_ov002_021bae7c(obj->flags & 1, -1) != 0)
        return 1;
    return 0;
}
