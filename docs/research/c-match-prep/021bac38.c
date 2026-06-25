/* CAMPAIGN-PREP candidate for func_021bac38 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla base (team&1); raw team to helper; e advances by 0x14; && guard chain; signed j 5..10
 *   risk:       need `mla r0,idx,0x868,base` (one op) not mul+add — emitted only if `&arr[team&1]` index-scales into the base add; if mwcc splits it, prologue diverges by one instr (reshape-able). Slot stride 0x14 / field_38 / +0x64 are struct-guessed
 *   confidence: low
 */
/* func_ov002_021bac38 (ov002): scan inner slot array (stride 0x14, starting at
 * Team+0x64) for slots 5..10; for each, q = func_ov002_021b9ecc(team, slot);
 * if q>0 and slot.field_38(u16)!=0 and q==target, return slot index. Else -1.
 *
 * base via `mla` (data_022cf16c + (team&1)*0x868); func_021b9ecc gets RAW team.
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

typedef struct Slot {
    u8  _p00[0x38];
    u16 field_38;             /* 0x38 */
    u8  _p3a[0x14-0x3a];
} Slot;                       /* stride 0x14 */

typedef struct Team {
    u8   _p00[0x64];
    Slot slots[64];           /* 0x064.. (slots[5..10] used) */
    u8   _tail[0x868-0x64-64*0x14];
} Team;

extern Team data_ov002_022cf16c[];
extern int  func_ov002_021b9ecc(int a, int b);

int func_ov002_021bac38(int team, int target) {
    Team *t = &data_ov002_022cf16c[team & 1];
    Slot *e = (Slot *)((u8 *)t + 0x64);
    int j = 5;
    do {
        int q = func_ov002_021b9ecc(team, j);
        if (q > 0 && e->field_38 != 0 && q == target)
            return j;
        j++;
        e = (Slot *)((u8 *)e + 0x14);
    } while (j <= 10);
    return -1;
}
