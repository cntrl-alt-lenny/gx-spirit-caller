/* CAMPAIGN-PREP candidate for func_021bbeac (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     counter+pointer 11-loop addne; :13 bitfields for lsl/lsrs; two global guards in source order
 *   risk:       loop counter(ip) is kept separate from the slot pointer(r3) and compared to 0xa; mwcc may instead use scaled index i*0x14, diverging the increment. reshape-able (do/while or pointer-end).
 *   confidence: med
 */
/* func_ov002_021bbeac : count non-empty slots over 11 + two global id-match bonuses */
typedef struct {
    unsigned int kind:13;   /* +0x00 */
    unsigned int :19;
    unsigned short _p4;
    unsigned short f6;
    unsigned short f8;
    unsigned short _pa;
    int fc;
    unsigned int f10;
} Slot;                      /* 0x14 */

typedef struct {
    int f0;                  /* +0x00 */
    int f4;                  /* +0x04 */
    char _p8[0x14];
    int f1c;                 /* +0x1c */
    int f20;                 /* +0x20 */
    char _p24[0xa0];
    unsigned int c4:13;      /* +0xc4 (lsl#19;lsrs#19) */
    unsigned int :19;
    char _pc8[0x10];
    unsigned int d8:13;      /* +0xd8 */
    unsigned int :19;
} Tbl3F4;

typedef struct {
    char _p0[0xd0];
    unsigned int d0;         /* +0xd0 */
    unsigned int d4;         /* +0xd4 */
} Tbl016C;

extern char data_ov002_022cf16c[];
extern Tbl3F4 data_ov002_022cd3f4;
extern Tbl016C data_ov002_022d016c;

int func_ov002_021bbeac(int side)
{
    Slot *s = (Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30);
    int count = 0;
    int i;

    for (i = 0; i < 11; i++) {
        if (s[i].kind != 0) count++;
    }
    if (data_ov002_022d016c.d0 & 1) {
        if (side == data_ov002_022cd3f4.f0) {
            if (data_ov002_022cd3f4.c4 != 0) count++;
        }
        if (side == data_ov002_022cd3f4.f4) {
            if (data_ov002_022cd3f4.d8 != 0) count++;
        }
    }
    return count;
}
