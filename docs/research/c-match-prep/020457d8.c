/* CAMPAIGN-PREP candidate for func_020457d8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     double null GUARD + SETTER + post-store call, return const
 *   risk:       minimal; struct field offsets (f0 word, f4 halfword) assume the inferred layout
 *   confidence: high
 */
/* func_020457d8: two null guards (singleton, then its f0 word), set f4=3,
 * fire func_02045678, return 1. All field touches precede the call, so the
 * singleton pointer is loaded once (no reload puzzle). */

typedef struct {
    int            f0;       /* +0x00 */
    unsigned short f4;       /* +0x04 */
} S;

extern S *data_0219dad0;
extern int func_02045678(void);

int func_020457d8(void) {
    S *s = data_0219dad0;

    if (s == 0) return 0;
    if (s->f0 == 0) return 0;
    s->f4 = 3;
    func_02045678();
    return 1;
}
