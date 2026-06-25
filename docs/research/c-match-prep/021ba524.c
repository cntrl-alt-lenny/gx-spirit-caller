/* CAMPAIGN-PREP candidate for func_021ba524 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clone of 430 on listB; 184 guard vs reloaded countB; nested compaction
 *   risk:       identical reg-pressure shape to 430 (r4-r8, reused r5/r7); nested-loop reg-alloc rotation (permuter-class). listB@0x3a0 / countB@0x18 struct-guessed
 *   confidence: low
 */
/* func_ov002_021ba524 (ov002): clone of 021ba430 on list B (offset 0x3a0,
 * count at 0x18 via data_022cf184). Word-compare search + compaction.
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
extern Team data_ov002_022cf184[];
extern void func_ov002_021b91c4(int *dst, const int *src);
extern int  func_ov002_021b91f8(int *a, int *b);

int func_ov002_021ba524(int team, int *key) {
    int idx = team & 1;
    if (data_ov002_022cf184[idx].hdr0 != 0) {
        Team *t = &data_ov002_022cf16c[idx];
        int *p = (int *)t->listB;
        u32 i = 0;
        do {
            if (func_ov002_021b91f8(p, key)) {
                u32 n = --data_ov002_022cf184[idx].hdr0;
                if (i < n) {
                    int *q = (int *)t->listB + i;
                    do {
                        func_ov002_021b91c4(q, (const int *)((int *)t->listB + (i + 1)));
                        i++;
                        q++;
                    } while (i < t->countB);
                }
                return 1;
            }
            i++;
            p++;
        } while (i < t->countB);
    }
    return 0;
}
