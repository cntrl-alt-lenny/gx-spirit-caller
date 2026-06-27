/* CAMPAIGN-PREP candidate for func_021ba748 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: clone of 6cc on listB(0x3a0)/countB(0x18); :13 key; count++ addne post-reload
 *   risk:       off=idx*0x868 reused for cf184 guard and reloaded bound [r7,#0x18] before addne; if mwcc hoists/merges bound the ldr/addne stream diverges. reshape-able. listB@0x3a0/countB@0x18 struct-guessed
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_021ba748 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note below.
 *   recipe:   CLASS D: clone of 021ba6cc on listB; list base +0x3a0, bound t->countB (+0x18); guard cf184; :13 key bitfield; count++ as addne after bound reload; decl count then i.
 *   risk:     same shape as 6cc: off=idx*0x868 reused for cf184 guard and reloaded bound [r7,#0x18]; reload sits before the addne. If mwcc hoists/merges the bound the ldr/addne stream diverges. reshape-able. listB@0x3a0 / countB@0x18 struct-guessed.
 *   confidence: low
 */
/* func_ov002_021ba748(team,val): clone of 021ba6cc on list B (0x3a0). idx=team&1,
 * guard cf184[idx].count, bound t->countB (+0x18) reloaded each iter,
 * count records whose :13 key passes func_0202df78(key,val)!=0. */
typedef unsigned char u8;
typedef unsigned int  u32;

typedef struct Rec { u32 key:13; u32 _hi:19; } Rec;
typedef struct Team {
    u32 hdr0;                 /* 0x000 */
    u8  _p04[0x18-0x04];
    u32 countB;               /* 0x018 */
    u8  _p1c[0x3a0-0x1c];
    Rec listB[80];            /* 0x3a0 */
    u8  _tail[0x868-0x3a0-80*4];
} Team;

extern Team data_ov002_022cf16c[];
extern Team data_ov002_022cf184[];   /* +0x18 view; word@0 = countB */
extern int  func_0202df78(int key, int val);

int func_ov002_021ba748(int team, int val) {
    int idx = team & 1;
    u32 count = 0;
    if (data_ov002_022cf184[idx].hdr0 != 0) {
        Team *t = &data_ov002_022cf16c[idx];
        Rec *p = t->listB;
        u32 i = 0;
        do {
            if (func_0202df78(p->key, val))
                count++;
            i++;
            p++;
        } while (i < t->countB);
    }
    return count;
}
