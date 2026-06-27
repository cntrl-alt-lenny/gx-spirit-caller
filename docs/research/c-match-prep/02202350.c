/* CAMPAIGN-PREP candidate for func_02202350 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind :6, b0 :1; cmpne chain for k==0x12||0x13; global struct f0/f1c loads
 *   risk:       021c1ef0 call: asm sets r2=[+0x1c] but leaves r1 from prior ldr (=f0/[+0]) — arg r1 ambiguous (modeled 0). Bind-vs-reload of the cd3f4 base across the two calls (orig reloads _LIT0 each time) — reshape-able (separate reads) but arg count struct-guessed.
 *   confidence: low
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
} Entity;

typedef struct {
    int f0;       /* +0x00 */
    u8 _p[0x18];
    int f1c;      /* +0x1c */
} Cd3f4;

extern Cd3f4 data_ov002_022cd3f4;
extern int func_ov002_021c1e44(Entity *e, int a, int b);
extern int func_ov002_021c1ef0(Entity *e, int a, int b);

int func_ov002_02202350(Entity *e)
{
    int k;

    k = e->kind;
    if (k != 0x12 && k != 0x13)
        return 0;
    if (data_ov002_022cd3f4.f0 != 1 - e->b0)
        return 0;
    if (func_ov002_021c1ef0(e, 0, data_ov002_022cd3f4.f1c) == 0)
        return 0;
    if (func_ov002_021c1e44(e, data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c) == 0)
        return 1;
    return 0;
}
