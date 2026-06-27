/* CAMPAIGN-PREP candidate for func_021bc55c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     slot[b] via nested mla a*0x868 then b*0x14; :13 bitfields; short-circuit && id-pairs; tail bool
 *   risk:       tail bl func_021bc288 takes no explicit arg but r0 deterministically holds a, so signature a-vs-void is guessed; wrong arity changes the call setup. struct-guessed (confirm callee arity).
 *   confidence: med
 */
/* func_ov002_021bc55c : single-slot kind test + two id-pair guards, tail-call boolean */
typedef struct {
    unsigned int kind:13;    /* +0x00 */
    unsigned int :19;
    char _p4[0x10];
} Slot;                      /* 0x14 */

typedef struct {
    int f0;                  /* +0x00 */
    int f4;                  /* +0x04 */
    char _p8[0x14];
    int f1c;                 /* +0x1c */
    int f20;                 /* +0x20 */
    char _p24[0xa0];
    unsigned int c4:13;      /* +0xc4 */
    unsigned int :19;
    char _pc8[0x10];
    unsigned int d8:13;      /* +0xd8 */
    unsigned int :19;
} Tbl3F4;

typedef struct {
    char _p0[0xd0];
    unsigned int d0;         /* +0xd0 */
} Tbl016C;

extern char data_ov002_022cf16c[];
extern Tbl3F4 data_ov002_022cd3f4;
extern Tbl016C data_ov002_022d016c;
extern int func_ov002_021bc288(int a);

int func_ov002_021bc55c(int a, int b)
{
    Slot *s = (Slot *)(data_ov002_022cf16c + (a & 1) * 0x868 + 0x30);
    if (s[b].kind != 0) return 0;
    if (data_ov002_022d016c.d0 & 1) {
        if (a == data_ov002_022cd3f4.f0 && b == data_ov002_022cd3f4.f1c) {
            if (data_ov002_022cd3f4.c4 != 0) return 0;
        }
        if (a == data_ov002_022cd3f4.f4 && b == data_ov002_022cd3f4.f20) {
            if (data_ov002_022cd3f4.d8 != 0) return 0;
        }
    }
    return func_ov002_021bc288(a) != 0;
}
