/* CAMPAIGN-PREP candidate for func_021c39ec (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 id then u16-narrow (lsl19/lsr19 then lsl16/lsr16); reload row+0xc bound; ret -1=mvn
 *   risk:       double extract <<19>>19 then <<16>>16: the call arg uses the u16 value (post both shifts); if mwcc drops the redundant <<16>>16 one shift pair vanishes. reshape-able (u16 temp forces it); count r5 init order vs i r4.
 *   confidence: med
 */
/* func_ov002_021c39ec: find index in player(arg0&1) 0x120 array (int*, stride4,
 * len *(row+0xc)) of first entry whose :13 id (as u16) is nonzero AND
 * func_0202b878(id)==22; return that i; else -1. count=cf178[idx]; if 0 ret -1.
 * id reloaded from arr each iter; v is u16 view of the :13 field. */
extern char data_ov002_022cf16c[];
extern int  data_ov002_022cf178[];
extern int  func_0202b878(unsigned int id);

struct Ov002Id13 { unsigned int v : 13; };

int func_ov002_021c39ec(int player) {
    int idx = (player & 1) * 0x868;
    char *row = (char *)data_ov002_022cf16c + idx;
    int *arr = (int *)(row + 0x120);
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf178 + idx) == 0)
        return -1;
    do {
        unsigned short v = (unsigned short)((struct Ov002Id13 *)&arr[i])->v;
        if (v != 0) {
            if (func_0202b878(v) == 0x16)
                return i;
        }
        i++;
    } while ((unsigned)i < (unsigned)*(int *)(row + 0xc));
    return -1;
}
