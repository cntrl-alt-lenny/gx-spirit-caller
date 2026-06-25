/* CAMPAIGN-PREP candidate for func_021ccf3c (ov011, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Multi-field RMW on one held base (bind base, hex offsets)
 *   risk:       WALL per ov011_core.h: >=2 field RMWs holding base/mask with no reload -> mwcc pools field ADDRESS, shifts reg-alloc; reverted before. No C phrasing recovers it
 *   confidence: low
 */
/* func_ov011_021ccf3c: straight RMW sequence on data_ov011_021d4000.
 * KNOWN MULTI-FIELD-RMW WALL (ov011_core.h: "Reverted ... 021ccf3c") -
 * holding the base across several field RMWs makes mwcc pool each field
 * ADDRESS instead of [base,#off], shifting register allocation. Cached base
 * does not recover it; this is a register-rename .s / permuter target.
 *
 *   ldr r0,=data_021d4000
 *   [+0x2b0] &= ~0xff; |= 0xff
 *   [+0x260] = [+0x238] - [+0x26c] + 0x80000
 *   [+0x264] = [+0x23c] - [+0x270] + 0x60000
 *   [+0x2ac] &= ~0xff00000
 */
extern char data_ov011_021d4000[];

void func_ov011_021ccf3c(void) {
    char *b = data_ov011_021d4000;
    *(int *)(b + 0x2b0) = (*(int *)(b + 0x2b0) & ~0xff) | 0xff;
    *(int *)(b + 0x260) = *(int *)(b + 0x238) - *(int *)(b + 0x26c) + 0x80000;
    *(int *)(b + 0x264) = *(int *)(b + 0x23c) - *(int *)(b + 0x270) + 0x60000;
    *(int *)(b + 0x2ac) = *(int *)(b + 0x2ac) & ~0xff00000;
}
