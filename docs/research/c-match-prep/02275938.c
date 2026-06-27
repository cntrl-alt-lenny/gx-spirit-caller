/* CAMPAIGN-PREP candidate for func_02275938 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: slot.id :13; id saved callee-saved r4 across 2 calls; CSE sum*20
 *   risk:       reshape-able: orig saves slot.id in callee-saved r4 so it survives the cf1a4 ldrh + both helper calls (movs r4,...,lsr#19). If mwcc keeps it caller-saved it reloads after each bl -> 2 extra ldr. The final ternary 0x800/0 should emit movne/moveq (matches asm tail).
 *   confidence: med
 */
/* func_ov002_02275938: sibling of 02275860 with a 5<=sum<=10 window and a
 * two-helper id gate (0202b8c0==4 && 0202b878==0x16). id is saved callee-
 * saved (survives the cf1a4 read + both calls), then 021c23ac decides 0x800. */
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cd300[];
extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];
extern int func_0202b878(int id);
extern int func_0202b8c0(int id);
extern int func_ov002_021c23ac(int player, int sum);
struct CD300 { unsigned bit0:1; unsigned rest:31; };
int func_ov002_02275938(int player, int a, int b) {
    int sum = a + b;
    int off = (player & 1) * 0x868;
    int row = sum * 20;
    int id;
    if (player != (int)((struct CD300 *)data_ov002_022cd300)->bit0) return 0;
    if (sum < 5) return 0;
    if (sum > 10) return 0;
    id = ((struct Ov002Slot *)(data_ov002_022cf16c + off + row + 0x30))->id;
    if (id == 0) return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + off + row) == 0) return 0;
    if (func_0202b8c0(id) != 4) return 0;
    if (func_0202b878(id) != 0x16) return 0;
    return func_ov002_021c23ac(player, sum) != 0 ? 0x800 : 0;
}
