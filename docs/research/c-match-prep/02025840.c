/* CAMPAIGN-PREP candidate for func_02025840 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Two single-bit tests (bind h) + invert (== 0) result
 *   risk:       bit extracts may compile to and-mask form not lsl;lsr without :1 bitfields; the two ifs might merge into one && altering branch layout
 *   confidence: med
 */
/* func_02025840: test bit 0 then bit 1 of the u16 flags at p+0x16a;
 * if both set return !func_02025880(p), else return 0. h loaded once
 * and shifted twice (bind, not reload). (h<<31)>>31 = bit0,
 * (h<<30)>>31 = bit1; cmp+moveq/movne realises the !result invert. */
extern int func_02025880(void *p);

int func_02025840(void *p) {
    unsigned short h = *(unsigned short *)((char *)p + 0x16a);
    if ((unsigned)(h << 31) >> 31) {
        if ((unsigned)(h << 30) >> 31) {
            return func_02025880(p) == 0;
        }
    }
    return 0;
}
