/* CAMPAIGN-PREP candidate for func_021ba6cc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: :13 key bitfield arg; count++ as addne after in-loop bound reload
 *   risk:       off=idx*0x868 held in one reg feeds both cf17c guard and reloaded bound [r7,#0x10]; if mwcc hoists the bound or reorders count++ the ldr/addne interleave diverges. reshape-able. 0x260/0x10 struct-guessed
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_021ba6cc (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note below.
 *   recipe:   CLASS D/C: idx=(a&1); off=idx*0x868 via mul (not &arr) so the off reg is reused for both the cf17c bound-load and the cf16c list base; :13 key bitfield arg; count++ as addne after the in-loop bound reload; decl count(r5) then i(r4); list base bound to r7, advancing rec ptr r6.
 *   risk:     orig holds off in one reg and forms BOTH ldr[cf17c+off] (entry guard, also the reloaded bound t->countA@+0x10 via r7) and add cf16c+off (list); it RELOADS the bound [r7,#0x10] each iter into r0 just before the addne. If mwcc hoists the bound or reorders count++ before the reload, the ldr/addne interleave diverges. reshape-able (reload bound inside the while-cond; keep count++ as conditional after). offsets 0x260/0x10 struct-guessed.
 *   confidence: low
 */
/* func_ov002_021ba6cc(team,val): count records in listA (0x260) whose decoded
 * :13 key passes func_0202df78(key,val)!=0. idx=team&1, off=idx*0x868,
 * guard cf17c[idx].count!=0, bound t->countA (+0x10) reloaded each iter. */
typedef unsigned char u8;
typedef unsigned int  u32;

typedef struct Rec { u32 key:13; u32 _hi:19; } Rec;
typedef struct Team {
    u32 hdr0;                 /* 0x000 */
    u8  _p04[0x10-0x04];
    u32 countA;               /* 0x010 */
    u8  _p14[0x260-0x14];
    Rec listA[80];            /* 0x260 */
    u8  _tail[0x868-0x260-80*4];
} Team;

extern Team data_ov002_022cf16c[];
extern Team data_ov002_022cf17c[];   /* +0x10 view; word@0 = countA */
extern int  func_0202df78(int key, int val);

int func_ov002_021ba6cc(int team, int val) {
    int idx = team & 1;
    u32 count = 0;
    if (data_ov002_022cf17c[idx].hdr0 != 0) {
        Team *t = &data_ov002_022cf16c[idx];
        Rec *p = t->listA;
        u32 i = 0;
        do {
            if (func_0202df78(p->key, val))
                count++;
            i++;
            p++;
        } while (i < t->countA);
    }
    return count;
}
