/* CAMPAIGN-PREP candidate for func_0227b0b8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: slot.id :13; r7 strided base +0x14; r6 max-fold seeded -1; const-1 arg
 *   risk:       reshape-able: orig holds the strided sub-row base in r7 (add #0x14 per iter, not recomputed) and the max in r6 seeded -1 (mvn). The 3rd helper arg is a constant 1 (r4=fp held). Risk: mwcc may re-index row = base+i*0x14 each iter instead of carrying r7; the if-assign max (not ternary) should match movgt.
 *   confidence: med
 */
/* func_ov002_0227b0b8: scan player (arg0&1)'s 5-slot sub-row (cf16c+off+0x30,
 * stride 0x14); for each occupied slot (slot.id!=0, i<arg1) call a ready-test
 * (arg2!=0 ? 021be384 : 021be4a0, 3rd arg const 1), and on success query
 * 021b090 into a 0x2c stack buf, accumulating max(buf@+0x14). Returns max,
 * seeded -1. cls C: r6 max-accumulator + r7 strided sub-row base. */
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021be384(int player, int i, int k);
extern int func_ov002_021be4a0(int player, int i, int k);
extern void func_ov002_0227b090(int player, int i, void *out);
int func_ov002_0227b0b8(int player, int arg1, int arg2) {
    char buf[0x2c];
    char *row = data_ov002_022cf16c + (player & 1) * 0x868 + 0x30;
    int best = -1;
    int i;
    for (i = 0; i <= 4; i++, row += 0x14) {
        int ok;
        if (i == arg1) continue;
        if (((struct Ov002Slot *)row)->id == 0) continue;
        if (arg2 != 0)
            ok = func_ov002_021be384(player, i, 1);
        else
            ok = func_ov002_021be4a0(player, i, 1);
        if (ok == 0) continue;
        func_ov002_0227b090(player, i, buf);
        if (*(int *)(buf + 0x14) > best)
            best = *(int *)(buf + 0x14);
    }
    return best;
}
