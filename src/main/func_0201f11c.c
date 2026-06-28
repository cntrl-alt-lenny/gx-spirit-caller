/* CAMPAIGN-PREP candidate for func_0201f11c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BOUNDED table lookup, unsigned compare + hs fallback
 *   risk:       low; sibling func_0201f0f4 confirms idiom. fallback ldr must stay predicated (ldrhs), not a branch
 *   confidence: high
 */
/* func_0201f11c: unsigned bounds-checked table lookup. (unsigned)i < 27 ->
 * data_020c6418[i]; else fallback &data_020c6484. Pure unsigned bound (no
 * signed low check), so cmp #0x1b; ldrlo; ldrhs. */

extern void *data_020c6418[];
extern char data_020c6484[];

int func_0201f11c(int i) {
    if ((unsigned int)i < 27) {
        return (int)data_020c6418[i];
    }
    return (int)data_020c6484;
}
