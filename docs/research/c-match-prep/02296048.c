/* CAMPAIGN-PREP candidate for func_02296048 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     5-bit field guard; reload flags inside loop; i<=0xa
 *   risk:       reshape-able: loop reloads ldrh each iter and recomputes f0 twice (r0/r2 alias) — if mwcc hoists the ldrh out of the loop the body diverges; keep flags read inside loop, not a local.
 *   confidence: med
 */
// func_ov002_02296048 — early guards then count loop
typedef struct Obj Obj;
struct Obj { unsigned short pad0; unsigned short flags; };

extern int  func_ov002_021b34f4(int a, int b, int c, int i);
extern int  func_ov002_021b3618(int a);
extern int  data_ov002_022ce288[];

int func_ov002_02296048(Obj *obj)
{
    int f5 = (obj->flags >> 1) & 0x1f;
    int i;

    if (f5 >= 5) {
        if ((func_ov002_021b3618(obj->flags & 1) & 0xff)
                == ((obj->flags >> 0) & 1))
            return 0;
        return 1;
    }

    if (data_ov002_022ce288[0x5d4 / 4] != 0)
        return 0;

    for (i = 0; i <= 0xa; i++) {
        if (func_ov002_021b34f4((obj->flags >> 1) & 0x1f,
                                obj->flags & 1,
                                obj->flags & 1, i) != 0)
            return 0;
    }
    return 1;
}
