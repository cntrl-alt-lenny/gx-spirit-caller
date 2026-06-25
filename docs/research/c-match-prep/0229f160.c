/* CAMPAIGN-PREP candidate for func_0229f160 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     out-param call, lsl#3 bounds-check chain, bool result
 *   risk:       out-param call signature; r1<<3 reused vs recomputed across 4 compares; addlt/movlt bool tail may reorder
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229f160 (ov002, class A).
 *   recipe:     null-guard, out-param call, 4 lsl#3 bounds compares, bool
 *   risk:       func_0229f2f8 out-param signature inferred; each (field<<3)
 *               is recomputed per use (not bound); the final movlt#1 bool
 *               tail vs the .L_978 mov#0 join may reorder
 *   confidence: med
 */
/* func_ov002_0229f160: if grid->f_0 is null return 0. Get origin via
 * func_ov002_0229f2f8(grid,&ox,&oy). Return 1 iff x in
 * [f_c*8, ox+f_c*8) and y in [f_10*8, oy+f_10*8); else 0. */

extern void func_ov002_0229f2f8(void *grid, int *ox, int *oy);

typedef struct {
    int f_0;              /* +0x00 */
    char _pad_04[0x8];
    int f_c;              /* +0x0c */
    int f_10;             /* +0x10 */
} Grid_0229f160;

int func_ov002_0229f160(Grid_0229f160 *grid, int x, int y) {
    int ox, oy;
    if (grid->f_0 == 0)
        return 0;
    func_ov002_0229f2f8(grid, &ox, &oy);
    if (x < (grid->f_c << 3)) return 0;
    if (x >= ox + (grid->f_c << 3)) return 0;
    if (y < (grid->f_10 << 3)) return 0;
    if (y < oy + (grid->f_10 << 3))
        return 1;
    return 0;
}
