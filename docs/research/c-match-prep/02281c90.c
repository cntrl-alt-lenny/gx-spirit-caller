/* CAMPAIGN-PREP candidate for func_02281c90 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     three counters c1/c2/c3 (decl order); :13 id at +0x418; reloaded unsigned bound; if-assign tally
 *   risk:       entry guard cmp cf180[idx],#0;bls — `>0` signed gives bgt not bls; write `(unsigned)..>0` if it diverges (reshape-able). Counter/idarr reg-alloc could still rotate (permuter-class)
 *   confidence: med
 */
/* func_ov002_02281c90 (ov002, cls C) — three-counter tally then decision.
 * idx=(player&1)*0x868. If cf180[idx]>0: loop i<row[+0x14] (reloaded) over
 * ids at +0x418 (:13): e234?c1++ : b878==0x16?c2++ : c3++. Then if
 * (c2>c1 && c2>=c3 && 021ba654(player,0x16)) return 1; if (c3<=c1 &&
 * 021ba5e0(player)) return 0; return 2. */
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_0202b878(int a);
extern int  func_0202e234(int a);
extern int  func_ov002_021ba5e0(int player);
extern int  func_ov002_021ba654(int player, int kind);

struct Ov002Slot { unsigned int id : 13; };

int func_ov002_02281c90(int player) {
    int idx = (player & 1) * 0x868;
    char *base;
    int c1;
    int c2;
    int c3;
    int i;
    unsigned int id;
    c1 = 0;
    c2 = 0;
    c3 = 0;
    i = 0;
    if (*(int *)((char *)data_ov002_022cf180 + idx) > 0) {
        char *idarr;
        base = data_ov002_022cf16c + idx;
        idarr = base + 0x418;
        for (; (unsigned)i < (unsigned)*(int *)(base + 0x14); i++) {
            id = ((struct Ov002Slot *)idarr)->id;
            if (func_0202e234(id) != 0)
                c1++;
            else if (func_0202b878(id) == 0x16)
                c2++;
            else
                c3++;
            idarr += 4;
        }
    }
    if (c2 > c1 && c2 >= c3) {
        if (func_ov002_021ba654(player, 0x16) != 0)
            return 1;
    }
    if (c3 <= c1 && func_ov002_021ba5e0(player) != 0)
        return 0;
    return 2;
}
