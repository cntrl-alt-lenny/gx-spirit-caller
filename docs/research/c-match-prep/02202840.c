/* CAMPAIGN-PREP candidate for func_02202840 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind :6 (==0x16→1, ==2 path); +0x04 halfword :9 bitfield (lsl#0x11;lsr#0x17) as 2nd arg
 *   risk:       the +0x04 field arg b uses `lsl#0x11;lsr#0x17` = bits6..14 width9 — model as :9 bitfield on the offset-4 halfword; if the real layout differs the extract shift diverges. struct-guessed (two overlapping bitfield views of one Entity).
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u8 _pad0[2];
    u16 b0 : 1;      /* bit 0 of +0x02 */
    u16 b1_5 : 5;
    u16 kind : 6;
    u16 b12_13 : 2;
    u16 b14 : 1;
    u16 b15 : 1;
    u16 b1_9 : 1;    /* placeholder, see h4 */
} Entity;

/* +0x04 halfword: bits 6..14 (width 9) extracted via lsl#0x11;lsr#0x17 */
typedef struct {
    u8 _pad0[4];
    u16 lo6 : 6;
    u16 mid9 : 9;
    u16 hi1 : 1;
} Entity4;

extern int func_ov002_021b99b4(int a, int b);
extern int func_ov002_021ff3bc(void);

int func_ov002_02202840(Entity *e)
{
    int k;

    k = e->kind;
    if (k == 0x16)
        return 1;
    if (k != 2)
        return 0;
    if (func_ov002_021ff3bc() == 0)
        return 0;
    return func_ov002_021b99b4(e->b0,
            ((Entity4 *)e)->mid9) >= 0 ? 1 : 0;
}
