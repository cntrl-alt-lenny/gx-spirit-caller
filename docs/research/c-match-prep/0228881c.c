/* CAMPAIGN-PREP candidate for func_0228881c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind global cd016c in one reg; bitfield <<20>>26 6-bit; u16 wrap add chain
 *   risk:       mid range-test uses u16 wrap of (bits6 + 0xffee); if mwcc folds the two adds or skips the lsl#16;lsr#16 u16 truncation, the cmp #1 / ldrls diverge. reshape-able (cast (u16) around full add, keep +0xee then +0xff00 split).
 *   confidence: med
 */
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

typedef struct { u16 unk0; u16 sel; } Ctx;

extern char data_ov002_022cd3f4[];
extern char data_ov002_022d016c[];

int func_ov002_0228881c(Ctx *ctx)
{
    u16 h = ctx->sel;
    char *g = data_ov002_022d016c;
    s32 cur = *(s32 *)(g + 0xcec);
    u16 v;

    if (cur == (s32)((h << 31) >> 31))
        return 0;

    v = (u16)(((h << 20) >> 26) + 0xee + 0xff00);
    if (v <= 1)
        return *(int *)(data_ov002_022cd3f4 + 0x8);

    return (*(s32 *)(g + 0xcf8) == 5) ? 1 : 0;
}
