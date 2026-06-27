/* CAMPAIGN-PREP candidate for func_022084e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (1-flag0) stride index; flag0 bound (held in r0 across load) and reused as call arg
 *   risk:       orig has `and ip,#1` after `rsb ip,flag0,#1` before mul; if mwcc drops the mask the index mul diverges. reshape-able (write !flag0 instead of 1-flag0).
 *   confidence: med
 */
/* func_ov002_022084e0 (ov002, D) — (1-flag0) table guard, perm call, tail-call.
 *   flag0 = card->attr bit0
 *   guard: *(int*)(data_022cf178 + (1-flag0)*0x868) must be nonzero
 *   if(!func_021b3ecc(flag0, 0xb, 0x1846)) and *(int*)(data_022cd3f4+0x24)==0 -> 0
 *   else tail-call func_02207a70(card, arg1).
 * Note: func_021b3ecc gets flag0 in r0 (r0 held across the table load), NOT the
 * loaded guard value (that is only tested). Stride 0x868 indexed by (1-flag0). */
struct Obj { unsigned short u0; unsigned short flag0 : 1, : 15; };

extern char data_ov002_022cf178[];
extern char data_ov002_022cd3f4[];
extern int  func_ov002_021b3ecc(int, int, int);
extern int  func_ov002_02207a70(struct Obj *, void *);

int func_ov002_022084e0(struct Obj *card, void *arg1) {
    int flag0 = card->flag0;
    if (*(int *)(data_ov002_022cf178 + (1 - flag0) * 0x868) == 0) return 0;
    if (!func_ov002_021b3ecc(flag0, 0xb, 0x1846)) {
        if (*(int *)(data_ov002_022cd3f4 + 0x24) == 0) return 0;
    }
    return func_ov002_02207a70(card, arg1);
}
