/* CAMPAIGN-PREP candidate for func_021c3350 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 bitfield; switch case0x40+default share body, 0x80 empty; stride-2 tag, stride-4 id
 *   risk:       the cmp#0x40;beq;cmp#0x80;beq;<fallthrough-body> chain: if mwcc collapses my switch to a single (tag!=0x80) test, one cmp is lost. reshape-able (force two compares; or if(tag==0x40||tag!=0x80)).
 *   confidence: low
 */
/* func_ov002_021c3350: count over player(arg0&1) row. Outer guard cf188[idx];
 * for first *(row+0x1c) entries: tag = (u8)((u16*)(row+0x788))[i]. switch(tag):
 * case 0x80 -> skip; case 0x40 and default -> test id13 = (:13) of
 * *(int*)(row+0x5d0)[? actually row+0x5d0 base, stride-4 via r6] and if
 * func_0202e234(id13) nonzero, count++. id reloaded via r6 (row+0x5d0, +=4). */
extern char data_ov002_022cf16c[];
extern int  data_ov002_022cf188[];
extern int  func_0202e234(unsigned int id);

struct Ov002Id13 { unsigned int v : 13; };

int func_ov002_021c3350(int player) {
    int idx = (player & 1) * 0x868;
    char *row = (char *)data_ov002_022cf16c + idx;
    int *idp = (int *)(row + 0x5d0);
    unsigned short *tags = (unsigned short *)(row + 0x788);
    int i;
    int count = 0;
    if (*(int *)((char *)data_ov002_022cf188 + idx) == 0)
        return count;
    for (i = 0; (unsigned)i < (unsigned)*(int *)(row + 0x1c); i++) {
        switch ((unsigned char)tags[i]) {
        case 0x40:
        default:
            if (func_0202e234(((struct Ov002Id13 *)idp)->v) != 0)
                count++;
            break;
        case 0x80:
            break;
        }
        idp++;
    }
    return count;
}
