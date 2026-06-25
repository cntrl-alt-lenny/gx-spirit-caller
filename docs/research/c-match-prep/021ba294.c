/* CAMPAIGN-PREP candidate for func_021ba294 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order i; bitfield :13 for lsl;lsr; bound reloaded each iter; two count relocs
 *   risk:       orig guards on data_022cf17c (off 0) but reloads t->countA (off 0x10) every iter; if mwcc CSEs them to one ldr, the entry-test reloc + a ldr diverge (reshape-able: keep two distinct extern symbols/views)
 *   confidence: med
 */
/* func_ov002_021ba294 (ov002): linear scan of team list A; return index
 * of first record whose decoded :13 key satisfies func_0202df78(key, val).
 *
 * idx = team & 1; off = idx*0x868 (sizeof Team).
 * entry guard reads data_022cf17c[idx] (a Team-strided view: word@0 = count),
 * loop bound re-reads t->countA (Team@0x10) each iter -> two separate relocs,
 * one shared `mul ...,#0x868`.
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

typedef struct Rec { u32 key:13; u32 _hi:19; } Rec;   /* [r6]: lsl#19;lsr#19 */

typedef struct Team {
    u32 hdr0;                 /* 0x000 (count view via data_022cf17c) */
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
extern Team data_ov002_022cf17c[];   /* same array shifted +0x10; word@0 = countA */
extern int  func_0202df78(int x, int y);

int func_ov002_021ba294(int team, int val) {
    int idx = team & 1;
    if (data_ov002_022cf17c[idx].hdr0 != 0) {
        Team *t = &data_ov002_022cf16c[idx];
        Rec *p = t->listA;
        u32 i = 0;
        do {
            if (func_0202df78(p->key, val))
                return i;
            i++;
            p++;
        } while (i < t->countA);
    }
    return -1;
}
