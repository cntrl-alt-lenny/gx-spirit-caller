/* CAMPAIGN-PREP candidate for func_021ba654 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     count loop; :13 bitfield; val saved in callee reg (r8); count++ as addeq; bound reload
 *   risk:       asm emits `cmp r8,r0` (val first) for the equality; mwcc may emit `cmp r0,r8` (result first) flipping nothing functionally but the operand order/reg pick can diverge (reshape-able: write `val == func(...)`). struct-guessed offsets
 *   confidence: med
 */
/* func_ov002_021ba654 (ov002): count records in list A whose decoded :13 key
 * maps (via func_0202b878) to `val`. Returns match count.
 *
 * r8=val saved, r5=count, r4=i. cmp r8,r0 then addeq r5,#1.
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

typedef struct Rec { u32 key:13; u32 _hi:19; } Rec;

typedef struct Team {
    u32 hdr0;                 /* 0x000 */
    u8  _p04[0x10-0x04];
    u32 countA;               /* 0x010 */
    u32 _p14;
    u32 countB;               /* 0x018 */
    u8  _p1c[0x260-0x1c];
    Rec listA[80];            /* 0x260 */
    Rec listB[80];            /* 0x3a0 */
    u8  _tail[0x868-0x4e0];
} Team;

extern Team data_ov002_022cf16c[];
extern Team data_ov002_022cf17c[];
extern int  func_0202b878(int key);

int func_ov002_021ba654(int team, int val) {
    int idx = team & 1;
    u32 count = 0;
    if (data_ov002_022cf17c[idx].hdr0 != 0) {
        Team *t = &data_ov002_022cf16c[idx];
        Rec *p = t->listA;
        u32 i = 0;
        do {
            if (func_0202b878(p->key) == val)
                count++;
            i++;
            p++;
        } while (i < t->countA);
    }
    return count;
}
