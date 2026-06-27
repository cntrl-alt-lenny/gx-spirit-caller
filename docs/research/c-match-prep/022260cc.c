/* CAMPAIGN-PREP candidate for func_022260cc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id-compare sets sel(=bit0 or 1-bit0); sub-then-switch; counter RMW store-order
 *   risk:       struct-guessed: the three ID_A/B/C literal state-ids are unknown (.word values not given) and table field offset +0x120 / counter inc order are inferred; sel default-undefined path may need exact fallthrough.
 *   confidence: low
 */
/* func_ov002_022260cc : lit-compare guards + jump-table + index store (class D) */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

struct Entity { u16 f0; u16 f2; };

extern u8  data_ov002_022ce288[]; /* state @+0x5a8; counters @+0x5ac,+0x5b0 (LIT3) */
extern u8  data_ov002_022cf16c[]; /* table base (LIT5/LIT6) */
extern u8  data_ov002_022cf178[]; /* parallel table */
#define STRIDE 0x868              /* LIT4 */
#define ID_A 0  /* LIT0 */
#define ID_B 0  /* LIT1 */
#define ID_C 0  /* LIT2 */

extern int func_ov002_021d71e0(int, int, int);
extern int func_ov002_021e104c(int);
extern int func_ov002_021e286c(int);

int func_ov002_022260cc(struct Entity *e)
{
    u32 id = e->f0;
    u32 sel;
    u8 *st = data_ov002_022ce288;
    u32 disp;

    if (id == ID_A || id == ID_C)
        sel = 1 - ((e->f2 << 0x1f) >> 0x1f);    /* .L_40c */
    else if (id == ID_B)
        sel = (e->f2 << 0x1f) >> 0x1f;          /* .L_420 */
    else
        sel = 0; /* falls through with r4 undefined in asm; see risk */

    disp = *(u32 *)(st + 0x5a8) - 0x7d;
    switch (disp) {                             /* 0..3 */
    case 0:                                     /* .L_454 */
        *(u32 *)(st + 0x5ac) = 0;
        *(u32 *)(st + 0x5b0) = 0;
        /* fallthrough */
    case 3: {                                   /* .L_460 */
        u32 idx = (sel & 1) * STRIDE;
        if (*(u32 *)(data_ov002_022cf178 + idx) == 0) return 0x7e;
        {
            u32 w = *(u32 *)(data_ov002_022cf16c + idx + 0x120);
            if (sel == ((w << 0x12) >> 0x1f)) {        /* .L_4c0 */
                *(u32 *)(st + 0x5ac) += 1;
            } else {
                *(u32 *)(st + 0x5b0) = 1;
                if (e->f0 != ID_C)
                    *(u32 *)(st + 0x5ac) += 1;
            }
            func_ov002_021d71e0(sel, 0, 1);
            return 0x7f;
        }
    }
    case 1:                                     /* .L_4f0 */
        func_ov002_021e286c(sel);
        return 0; /* truncated */
    case 2:                                     /* .L_518 truncated */
    default:                                    /* .L_52c */
        return 0;
    }
}
