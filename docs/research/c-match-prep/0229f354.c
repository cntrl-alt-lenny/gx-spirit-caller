/* CAMPAIGN-PREP candidate for func_0229f354 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     out-param call, signed /2 round, lsl#3 center, paired stores
 *   risk:       (x+(x>>31))>>1 must stay the round-div-2 idiom not sdiv; the 4 stores ([r4]/[sp8]/[sp+c]/[r4+4]) order/dup must match
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229f354 (ov002, class A).
 *   recipe:     out-param call; signed (x+(x>>31))>>1 halve; lsl#3; paired
 *               stores to out struct and scratch copies
 *   risk:       the (x + (x>>31))>>1 round-toward-zero halve must stay add+
 *               asr#1 not a divide call; the duplicated stores (cx to [r4]
 *               and a scratch, cy likewise) ordering must reproduce
 *   confidence: med
 */
/* func_ov002_0229f354: out->cx = grid->f_c*8 + ox/2; out->cy =
 * grid->f_10*8 + oy/2 (signed halves), where (ox,oy) come from
 * func_ov002_0229f2f8(grid,&ox,&oy). */

extern void func_ov002_0229f2f8(void *grid, int *ox, int *oy);

typedef struct {
    char _pad_00[0xc];
    int  f_c;             /* +0x0c */
    int  f_10;            /* +0x10 */
} Grid_0229f354;

typedef struct {
    int cx;               /* +0x00 */
    int cy;               /* +0x04 */
} Out_0229f354;

void func_ov002_0229f354(Out_0229f354 *out, Grid_0229f354 *grid) {
    int ox, oy;
    int cx, cy;
    func_ov002_0229f2f8(grid, &ox, &oy);
    cx = (grid->f_c << 3) + ((ox + ((unsigned int)ox >> 31)) >> 1);
    cy = (grid->f_10 << 3) + ((oy + ((unsigned int)oy >> 31)) >> 1);
    out->cx = cx;
    out->cy = cy;
}
