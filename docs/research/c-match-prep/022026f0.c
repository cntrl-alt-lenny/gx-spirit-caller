/* CAMPAIGN-PREP candidate for func_022026f0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind :6==0xd; h0 at +0; cmpeq-chain short-circuit (&&) using b0/b1_5 vs f0/f1c, f4/f20
 *   risk:       asm keeps b0 (r3,lsr#0x1f form) live and reuses across both && groups, reloading cd3f4 base (_LIT0) twice; if mwcc reloads b0 (fresh ldrh) or binds the base, the ldr/shift pattern diverges. reshape-able via reload order; tail-branch layout otherwise permuter-class.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 h0;          /* +0x00 */
    u16 b0 : 1;      /* bit 0 of +0x02 */
    u16 b1_5 : 5;
    u16 kind : 6;
    u16 b12_13 : 2;
    u16 b14 : 1;
    u16 b15 : 1;
} Entity;

typedef struct {
    int f0;       /* +0x00 */
    int f4;       /* +0x04 */
    u8 _p[0x14];
    int f1c;      /* +0x1c */
    int f20;      /* +0x20 */
} Cd3f4;

extern Cd3f4 data_ov002_022cd3f4;
extern int func_ov002_021b3fd8(int a, int b, u16 h0, int z);

int func_ov002_022026f0(Entity *e)
{
    if (e->kind != 0xd)
        return 0;
    if (func_ov002_021b3fd8(e->b0, e->b1_5, e->h0, 0) != 0)
        return 0;
    if (data_ov002_022cd3f4.f0 == e->b0 &&
        data_ov002_022cd3f4.f1c == e->b1_5)
        return 1;
    if (data_ov002_022cd3f4.f4 == e->b0 &&
        data_ov002_022cd3f4.f20 == e->b1_5)
        return 1;
    return 0;
}
