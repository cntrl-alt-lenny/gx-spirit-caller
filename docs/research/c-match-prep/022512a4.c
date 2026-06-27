/* CAMPAIGN-PREP candidate for func_022512a4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id :13 bitfield; >0x5dc literal (rematerialized as 0x868-0x28c); same word unpack; reloaded count
 *   risk:       Compiled+disasm: guard popls AND sub r4,r0,#0x28c (0x5dc) BOTH match orig; logic exact. Diff = register rotation + unpack combine add lsl#1 vs orig lsr#31. permuter-class.
 *   confidence: med
 */
/* func_ov002_022512a4: loop slots [0x260]; gate on matching card type and
 * func_0202b950(id) <= 0x5dc, then unpack the slot word to func_021b3fd8. */
struct Ov002Slot { unsigned int id : 13; };
extern int func_0202b878(int a);
extern int func_0202b950(int a);
extern int func_ov002_021b3fd8(int player, int a, int b, int c);
extern int func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
void func_ov002_022512a4(int player, int arg1) {
    int off = (player & 1) * 0x868;
    char *row;
    struct Ov002Slot *slot;
    int i;
    if (*(int *)(data_ov002_022cf17c + off) == 0)
        return;
    row = data_ov002_022cf16c + off;
    slot = (struct Ov002Slot *)(row + 0x260);
    for (i = 0; (unsigned int)i < *(unsigned int *)(row + 0x10); i++) {
        int id = slot[i].id;
        int word;
        int v;
        if (func_0202b878(id) != func_0202b878(arg1))
            continue;
        if (func_0202b950(id) > 0x5dc)
            continue;
        word = *(int *)&slot[i];
        v = (((unsigned int)(word << 2) >> 24) << 1) + ((unsigned int)(word << 18) >> 31);
        if (func_ov002_021b3fd8(player, 0xb, 0x12a1, v) != 0)
            continue;
        func_ov002_02253458(player, 0xd, i);
    }
}
