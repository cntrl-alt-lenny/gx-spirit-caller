/* CAMPAIGN-PREP candidate for func_021ba430 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two-pointer search+compact; entry guard 17c vs reloaded countA; advancing q dst
 *   risk:       5 callee regs (r4,r5,r6,r7,r8) with r5/r7 reused for off then list ptrs; mwcc reg-alloc of i/list/off/key across nested loops likely rotates (permuter-class). countA/0x260 struct-guessed
 *   confidence: low
 */
/* func_ov002_021ba430 (ov002): search list A for a record whose full word
 * equals *key (via func_ov002_021b91f8), then compact and decrement count.
 * Returns 1 if found+removed, else 0.
 *
 * func_ov002_021b91f8(a,b) = (*a == *b); func_ov002_021b91c4 = word copy.
 * Records compared as whole words here (no :13 decode in 38c/430/524).
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
extern void func_ov002_021b91c4(int *dst, const int *src);
extern int  func_ov002_021b91f8(int *a, int *b);

int func_ov002_021ba430(int team, int *key) {
    int idx = team & 1;
    if (data_ov002_022cf17c[idx].hdr0 != 0) {
        Team *t = &data_ov002_022cf16c[idx];
        int *p = (int *)t->listA;
        u32 i = 0;
        do {
            if (func_ov002_021b91f8(p, key)) {
                u32 n = --data_ov002_022cf17c[idx].hdr0;
                if (i < n) {
                    int *q = (int *)t->listA + i;
                    do {
                        func_ov002_021b91c4(q, (const int *)((int *)t->listA + (i + 1)));
                        i++;
                        q++;
                    } while (i < t->countA);
                }
                return 1;
            }
            i++;
            p++;
        } while (i < t->countA);
    }
    return 0;
}
