/* CAMPAIGN-PREP candidate for func_022023d8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     w14 raw shifts for bit9/bits10-13; dual stride-0x868 base + idx*0x14; :13 mask
 *   risk:       asm reuses r2*0x868 product (lr) for BOTH tables and shares ip=idx*0x14 — if mwcc recomputes the 0x868 mul / idx*0x14 instead of CSE, two muls diverge. permuter-class for the CSE; struct-guessed strides/0x30 offset.
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
    u8 _pad4[0x10];
    u32 w14;          /* +0x14 packed flags */
} Entity;

/* inner stride-0x14 record; outer stride-0x868 */
typedef struct {
    u8 _p30[0x30];
    u32 f30;          /* +0x30 low-13-bit flags */
} Rec;

extern u8 data_ov002_022cf16c[];   /* _LIT1: Rec arrays, stride 0x868 */
extern u8 data_ov002_022cf1a4[];   /* _LIT2: u16 arrays, stride 0x868 */
extern int func_ov002_021c84a8(void);

int func_ov002_022023d8(Entity *e)
{
    u32 w;
    int sel;
    int idx;
    Rec *p;
    u16 h;

    w = e->w14;
    sel = w << 0x16 >> 0x1f;          /* bit 9 */
    if (sel == e->b0)
        return 0;
    idx = w << 0x12 >> 0x1c;          /* bits 10..13 */
    p = (Rec *)(data_ov002_022cf16c + (sel & 1) * 0x868 + idx * 0x14);
    if ((p->f30 << 0x13 >> 0x13) == 0)
        return 0;
    h = *(u16 *)(data_ov002_022cf1a4 + (sel & 1) * 0x868 + idx * 0x14);
    if (h == 0)
        return 0;
    return func_ov002_021c84a8() <= 0x7d0 ? 1 : 0;
}
