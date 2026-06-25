/* CAMPAIGN-PREP candidate for func_0206ba4c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two accessor calls, subtract, conditional-negate (rsbeq); reload global
 *   risk:       hoist of *p1 load before first call may reorder; struct offsets 0x498/0x49c guessed; reg-alloc on saved result may flip
 *   confidence: med
 */
/* func_0206ba4c: d = func_02068a20(*p0, g->_498, 0) - func_02068a20(*p1,
 * g->_498, 0); if (g->_49c == 0) d = -d; return d.  g = *data_0219ecd4,
 * reloaded each use (separate refs).
 */

typedef struct {
    char _pad_00[0x498];
    int  scale;            /* +0x498 */
    int  flip;             /* +0x49c */
} Cfg;

extern Cfg *data_0219ecd4;
extern int  func_02068a20(int a, int b, int c);

int func_0206ba4c(int *p0, int *p1) {
    int a = func_02068a20(*p0, data_0219ecd4->scale, 0);
    int b = func_02068a20(*p1, data_0219ecd4->scale, 0);
    int d = a - b;
    if (data_0219ecd4->flip == 0)
        d = -d;
    return d;
}
