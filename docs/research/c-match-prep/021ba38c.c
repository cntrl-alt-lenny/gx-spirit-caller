/* CAMPAIGN-PREP candidate for func_021ba38c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order p; entry-test on --count(reg), loop-back reloads t->countA; advancing dst ptr
 *   risk:       compaction src &listA[pos+1] is recomputed from list base each iter while dst p advances (r5); if mwcc instead advances both or hoists base, the inner add/ldr stream diverges (permuter-class: r5/r6/r7 rotation)
 *   confidence: low
 */
/* func_ov002_021ba38c (ov002): remove element at `pos` from list A, copy it
 * to *out, then compact (shift listA[k]=listA[k+1]) and decrement count.
 * Returns 0 if pos out of range, else 1.
 *
 * helper func_ov002_021b91c4(dst,src) = word copy *dst=*src.
 * NOTE: count decremented in-register (sub;str;use) for the entry-into-loop
 * test, but the loop-back bound reloads t->countA (0x10).
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

int func_ov002_021ba38c(int team, int pos, int *out) {
    int idx = team & 1;
    if ((u32)pos >= data_ov002_022cf17c[idx].hdr0)
        return 0;
    {
        Team *t = &data_ov002_022cf16c[idx];
        Rec *p = &t->listA[pos];
        u32 n;
        func_ov002_021b91c4(out, (const int *)p);
        n = --data_ov002_022cf17c[idx].hdr0;
        if ((u32)pos < n) {
            do {
                func_ov002_021b91c4((int *)p, (const int *)&t->listA[pos + 1]);
                pos++;
                p++;
            } while ((u32)pos < t->countA);
        }
    }
    return 1;
}
