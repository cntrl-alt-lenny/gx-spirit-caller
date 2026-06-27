/* CAMPAIGN-PREP candidate for func_02051168 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     outer if-chain on getter[0x15]; inner dense 0..0xb computed-goto, most cases return
 *   risk:       Inner switch spans 0..0xb (cmp #0xb, 12 dense slots); only 2,3,4,5,11 hit the tail. mwcc must emit addls table not if-cascade — needs all 12 cases. reshape-able + struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02051168 (main, class D, MED tier) — brief 497.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     outer if-chain on getter[0x15]; inner computed-goto 0..0xb table where most cases return
 *   risk:       inner switch(ctx->x1a0) spans 0..0xb (cmp #0xb, 12 dense slots) where only cases 2,3,4,5,11 fall to the shared tail and the rest are bare returns; mwcc must emit a dense addls table not an if-cascade — needs ALL 12 cases present (most -> return). reshape-able (write empty case 0/1/6/8/9/10 returns) + struct-guessed.
 *   confidence: med
 */
/* func_02051168 — main, cls D. movs r4,r0; if 0 return. func_02067608(). If
   r4->b4 != 0 return. Then switch(func_020498f0()->x15): 0/1 -> .L_1068 inner
   table, 2 -> .L_10bc, else return. .L_1068: switch(getter->x1a0) over 0..0xb;
   cases 2,3,4,5,11 -> tail func_020673dc(getter->x10); others return. .L_10bc:
   if getter->x1a0 != 0xb return; else same tail. Getter RELOADED per use. */
typedef unsigned char u8;
extern u8 *func_020498f0(void);
extern void func_02067608(void);
extern void func_020673dc(int arg);

void func_02051168(void *obj)
{
    if (obj == 0)
        return;
    func_02067608();
    if (*(int *)((char *)obj + 0xb4) != 0)
        return;

    switch (func_020498f0()[0x15]) {
    case 0:
    case 1:                                       /* .L_1068 */
        switch (*(int *)(func_020498f0() + 0x1a0)) {
        case 2:
        case 3:
        case 4:
        case 5:
        case 11:                                  /* .L_10ac shared tail */
            func_020673dc(*(int *)(func_020498f0() + 0x10));
            return;
        default:                                  /* 0,1,6,7,8,9,10 -> return */
            return;
        }
    case 2:                                       /* .L_10bc */
        if (*(int *)(func_020498f0() + 0x1a0) != 0xb)
            return;
        func_020673dc(*(int *)(func_020498f0() + 0x10));
        return;
    default:
        return;
    }
}
