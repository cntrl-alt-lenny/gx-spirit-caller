/* CAMPAIGN-PREP candidate for func_021ac458 (ov009, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD gate + && hit-test chain (proven 021aa578)
 *   risk:       the ldrh fields must stay u16 and reuse the loaded base; success path's addgt/movgt/ldmgt predication may diverge from the && lowering
 *   confidence: med
 */
/* func_ov009_021ac458: rectangle-vs-cursor hit test. Fetch the cursor point
 * into (X@sp+4, Y@sp+0) via func_02006110; gate on func_020061ac() (active?).
 * The rect is the u16 quad at *r4: x=f0, w=f4, y=f2, h=f6. Hit iff
 * x<=X && x+w>X && y<=Y && y+h>Y. Returns 1 on hit else 0. (Same && compare-
 * chain recipe as ov008 021aa578: short-circuit to a shared return 0.) */

extern void func_02006110(int *px, int *py);
extern int func_020061ac(void);

int func_ov009_021ac458(int unused, unsigned short *rect) {
    int X, Y;
    func_02006110(&X, &Y);
    if (func_020061ac() == 0) {
        return 0;
    }
    if (rect[0] <= X && rect[0] + rect[2] > X &&
        rect[1] <= Y && rect[1] + rect[3] > Y) {
        return 1;
    }
    return 0;
}
