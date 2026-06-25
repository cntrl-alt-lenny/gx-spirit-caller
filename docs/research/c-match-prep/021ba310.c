/* CAMPAIGN-PREP candidate for func_021ba310 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clone of 294 on listB; :13 bitfield; reload countB each iter; two relocs
 *   risk:       same as 294: entry guard data_022cf184 vs reloaded t->countB (both addr base+0x18); CSE collapse drops one ldr (reshape-able: distinct extern views). listB@0x3a0 struct-guessed
 *   confidence: med
 */
/* func_ov002_021ba310 (ov002): clone of 021ba294 on list B.
 * idx*0x868 base; entry guard data_022cf184[idx] (word@0=countB),
 * list at t->listB (0x3a0), bound t->countB (0x18). :13 key decode.
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
extern Team data_ov002_022cf184[];   /* same array shifted +0x18; word@0 = countB */
extern int  func_0202df78(int x, int y);

int func_ov002_021ba310(int team, int val) {
    int idx = team & 1;
    if (data_ov002_022cf184[idx].hdr0 != 0) {
        Team *t = &data_ov002_022cf16c[idx];
        Rec *p = t->listB;
        u32 i = 0;
        do {
            if (func_0202df78(p->key, val))
                return i;
            i++;
            p++;
        } while (i < t->countB);
    }
    return -1;
}
