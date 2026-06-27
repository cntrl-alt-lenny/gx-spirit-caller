/* CAMPAIGN-PREP candidate for func_0201f0c8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BOUNDED table lookup, unsigned compare + hs fallback
 *   risk:       low; sibling func_0201f0a0 confirms idiom. fallback ldr must stay predicated (ldrhs), not a branch
 *   confidence: high
 */
/* func_0201f0c8: unsigned bounds-checked table lookup. (unsigned)i < 27 ->
 * data_020c6338[i]; else fallback &data_020c63a4. Pure unsigned bound (no
 * signed low check), so cmp #0x1b; ldrlo; ldrhs. */

extern void *data_020c6338[];
extern char data_020c63a4[];

int func_0201f0c8(int i) {
    if ((unsigned int)i < 27) {
        return (int)data_020c6338[i];
    }
    return (int)data_020c63a4;
}
