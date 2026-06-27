/* CAMPAIGN-PREP candidate for func_0220257c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind :6 == 0xf; global base held in r2 across f0/f8/f1c loads; w14 low16 movs test
 *   risk:       orig BINDS cd3f4 base in r2 across f0,f8,f1c (single ldr _LIT0) — mwcc may reload per-field giving extra ldr. Reshape-able: bind to one local `Cd3f4 *g`. call r1/r2 args struct-guessed (r1 leftover=f0).
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u8 _pad0[2];
    u16 b0 : 1;
    u16 b1_5 : 5;
    u16 kind : 6;
    u16 b12_13 : 2;
    u16 b14 : 1;
    u16 b15 : 1;
    u8 _pad4[0x10];
    u32 w14;          /* +0x14, low 16 bits tested */
} Entity;

typedef struct {
    int f0;       /* +0x00 */
    u8 _p4[4];
    int f8;       /* +0x08 */
    u8 _p[0x10];
    int f1c;      /* +0x1c */
} Cd3f4;

extern Cd3f4 data_ov002_022cd3f4;
extern int func_ov002_021c1ef0(Entity *e, int a, int b);

int func_ov002_0220257c(Entity *e)
{
    if (e->kind != 0xf)
        return 0;
    if (data_ov002_022cd3f4.f0 != e->b0)
        return 0;
    if (data_ov002_022cd3f4.f8 == 0)
        return 0;
    if (func_ov002_021c1ef0(e, data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c) == 0)
        return 0;
    return (e->w14 & 0xffff) != 0 ? 1 : 0;
}
