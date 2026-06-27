/* CAMPAIGN-PREP candidate for func_021c2bd4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if(i>=0){loop} else fall-through shared return 0; reverse ptr walk; +0x418 split as +0x18+0x400
 *   risk:       VERIFIED close match; minor: orig uses bmi to a shared mov r0,#0 tail, mine subs;movmi/bmi join may schedule the count-1 guard slightly differently — reshape-able (already restructured to share the zero tail).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c2bd4 (ov002, class C) — MED tier.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 *   recipe:  parity*0x868 base; reverse scan arr[+0x418] from count-1; mul (not mla) for count index
 * func_021c2bd4(player, arg1): scan player's elem array high->low; first element
 *   for which 021b91f8(&elem, arg1)!=0 -> return 021c2b4c(player, idx); else 0.
 *   count = *(int*)(cf180 + (player&1)*0x868); array at cf16c block +0x418.
 */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_ov002_021b91f8(int *elem, int arg1);
extern int  func_ov002_021c2b4c(int player, int idx);

int func_ov002_021c2bd4(int player, int arg1)
{
    int base = (player & 1) * 0x868;
    int *elem;
    int i;

    i = *(int *)(data_ov002_022cf180 + base) - 1;
    if (i >= 0) {
        elem = (int *)(data_ov002_022cf16c + base + 0x418) + i;
        do {
            if (func_ov002_021b91f8(elem, arg1) != 0)
                return func_ov002_021c2b4c(player, i);
            elem--;
            i--;
        } while (i >= 0);
    }

    return 0;
}
