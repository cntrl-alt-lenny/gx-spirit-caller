/* CAMPAIGN-PREP candidate for func_02295efc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bank parity (1-f0)&1*stride; bind base, if-assign returns
 *   risk:       reshape-able: the two distinct base globals (cf16c vs cf178, 0xC apart) — if mwcc CSEs them to one ldr+offset the literal pool diverges; keep as separate extern symbols.
 *   confidence: med
 */
// func_ov002_02295efc — bank-index predicate, guard chain
typedef struct Obj Obj;
struct Obj { unsigned short pad0; unsigned short flags; };
#define F0(o)  ( (o)->flags & 1 )
#define F5_1(o) ( ((o)->flags >> 1) & 0x1f )

extern int  func_ov002_02257ab8(void);
extern int  func_ov002_02259f74(int bankParity);
extern int  func_ov002_021be4a0(int a, int b, int c);
extern int  func_ov002_02280980(int a);
extern int  data_ov002_022cf178[];   // == data_022cf16c + 0xC, stride 0x868
extern int  data_ov002_022cf16c[];

int func_ov002_02295efc(Obj *obj)
{
    int parity = obj->flags & 1;            /* r5 */
    int idx = ((1 - parity) & 1) * 0x868;   /* r4 byte index */
    int r;

    r = func_ov002_02257ab8();
    if ((*(int *)((char *)data_ov002_022cf178 + idx) + r) == 0)
        return 0;

    if (*(int *)((char *)data_ov002_022cf16c + idx) <= 0xb54) {
        if (func_ov002_02259f74(parity) != 0)
            return 1;
    }

    if (func_ov002_021be4a0((obj->flags >> 0) & 1,
                            (obj->flags >> 1) & 0x1f, 1) == 0)
        return 1;

    if (func_ov002_02280980(obj->flags & 1) <= 0)
        return 1;
    return 0;
}
