/* CAMPAIGN-PREP candidate for func_02281b5c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard early-return; :13 id; reloaded unsigned bound + (cnt+1)>>1 half-test; movge-pair sum
 *   risk:       loop holds idx/base/idarr across 2 counters with 2 reloads of row[+0xc] per iter and 2 of cf178[idx]; reg colouring of c2/c3/idarr likely rotates. permuter-class
 *   confidence: low
 */
/* func_ov002_02281b5c (ov002, cls C) — guarded scan with three counters.
 * If 021c3cf0(player): id=slot[row] (:13) at base+row*4+0x120; t=b878(id);
 * t==0x16->1, 0x17->2, else 0. Else loop i<row[+0xc] (reloaded): for the
 * first (row[+0xc]+1)/2 entries inspect id at +0x120 (e234?c2++ : b878==0x16?
 * c3++); the rest call 021b00d0(2) (nz?c2++:c3++). Tail: r=021b00d0(cf178
 * [idx]); return (r>=c2)+(r>=c2+c3). Per-player idx=(player&1)*0x868. */
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int  func_0202b878(int a);
extern int  func_0202e234(int a);
extern int  func_ov002_021b00d0(int a);
extern int  func_ov002_021c3cf0(int player);

struct Ov002Slot { unsigned int id : 13; };

int func_ov002_02281b5c(int player, int row) {
    int idx;
    char *base;
    int c2;
    int c3;
    int i;
    unsigned int id;
    int r;
    if (func_ov002_021c3cf0(player) != 0) {
        char *b = data_ov002_022cf16c + (player & 1) * 0x868;
        int t = func_0202b878(((struct Ov002Slot *)(b + row * 4 + 0x120))->id);
        if (t == 0x16)
            return 1;
        if (t == 0x17)
            return 2;
        return 0;
    }
    idx = (player & 1) * 0x868;
    base = data_ov002_022cf16c + idx;
    c2 = 0;
    c3 = 0;
    i = 0;
    if (*(int *)((char *)data_ov002_022cf178 + idx) > 0) {
        char *idarr = base + 0x120;
        for (; (unsigned)i < (unsigned)*(int *)(base + 0xc); i++) {
            if ((unsigned)i >= ((unsigned)*(int *)(base + 0xc) + 1) >> 1) {
                if (func_ov002_021b00d0(2) != 0)
                    c2++;
                else
                    c3++;
            } else {
                id = ((struct Ov002Slot *)idarr)->id;
                if (func_0202e234(id) != 0)
                    c2++;
                else if (func_0202b878(id) == 0x16)
                    c3++;
            }
            idarr += 4;
        }
    }
    r = func_ov002_021b00d0(*(int *)((char *)data_ov002_022cf178 + idx));
    return ((r >= c2) ? 1 : 0) + ((r >= c2 + c3) ? 1 : 0);
}
