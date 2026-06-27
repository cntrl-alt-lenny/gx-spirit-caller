/* CAMPAIGN-PREP candidate for func_0227af30 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: per-player *0x868 + idx*0x14 indices; bit0 of :15 slot; threshold if-trees write out fields in order
 *   risk:       TRUNCATED at .L_124 — merge/return + the exact _LIT5/_LIT6/_LIT7 constants are unrecovered, so the f14/f18 store values are struct-guessed. mul-index base reload + branch layout permuter-class. Confidence low: structure plausible, constants/tail unverified.
 *   confidence: low
 */
/* func_ov002_0227af30 (ov002, class D, MED) — mul-index per-player tables +
 * branchy timing setup. NOTE: asm TRUNCATED at .L_124 (the merge/return tail
 * is cut). Reads cf16c/cf1a4/cf1ac at (player&1)*0x14_record + idx*0x14; if the
 * cf16c u16 slot is busy -> reset+021c4c9c+return; else read a state int, post
 * 0202b8a8 result to out+0x10, branch on thresholds writing out+0x14/+0x18. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Out { char pad0[0x10]; int f10; int f14; int f18; };

extern u16  data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int  func_0202b8a8(int v);
extern int  func_ov002_021bae7c(int player, int a, int b);
extern void func_ov002_021c4c9c(int v, int a, void *c);

int func_ov002_0227af30(int player, int idx, struct Out *out)
{
    int rec = (player & 1) * 0x868;
    int off = idx * 0x14;
    u16 *busy = (u16 *)((char *)data_ov002_022cf16c + rec + off);
    int st;
    int v;
    if (*busy != 0)
        return 0;                                  /* .L_138 tail (truncated) */
    st = *(int *)(data_ov002_022cf1a4 + rec + off + 0x30);
    v = (int)((u32)*(int *)(data_ov002_022cf1ac + rec + off) >> 8);
    if ((((u32)st << 0x13) >> 0x13) & 1) {          /* bit0 of :15 slot busy flag */
        *busy = 1;
        func_ov002_021c4c9c(v, 0, 0);
        *busy = 0;
        return 0;
    }
    out->f10 = func_0202b8a8(v);
    if (*(int *)(data_ov002_022cf1a4 + ((1 - player) & 1) * 0x868) < 0x3e8 ||
        func_ov002_021bae7c(player, -1, 0) != 0) {
        if (out->f10 > 4) { out->f14 = 0x4b0; out->f18 = 0x960; }
        else              { out->f14 = 0x7d0; out->f18 = 0x7d0; }
    } else {
        if (out->f10 > 4) { out->f14 = 0x4b0; out->f18 = 0x4b0 - 0x12c; }
        else              { out->f14 = 0x4b0; out->f18 = 0x3e8; }
    }
    return 0;
}
