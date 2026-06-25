/* CAMPAIGN-PREP candidate for func_021af874 (ov005, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     chan :3 bitfield guard + dense 0..3 switch (jump-table) returning constants
 *   risk:       DOCUMENTED 83% miss (ov005_core.h): the chan!=0 handler and the default block are emitted in swapped order by mwcc block placement; register/layout-resistant
 *   confidence: low
 */
/* func_ov005_021af874: if the global mode channel is set, route arg1; else a
 * dense switch on arg1 returning per-case constants (glyph codes via
 * func_0202c0c0, a default code address, or arg0+0x8c).
 * KNOWN near-miss (ov005_core.h wave 2): mwcc swaps the chan!=0 handler vs the
 * default block placement; this is the canonical clean-C attempt. */
extern struct { int w0; unsigned chan : 3; } data_02104f4c;
extern char data_ov005_021b1618[];
extern int  func_0202c0c0(int a);

int func_ov005_021af874(int a0, int sel) {
    if (data_02104f4c.chan != 0)
        return func_0202c0c0(sel + 0xf7);
    switch (sel) {
    case 0:
        return (int)data_ov005_021b1618;
    case 1:
        return func_0202c0c0(0xf7);
    case 2:
        return func_0202c0c0(0xf9);
    case 3:
        return a0 + 0x8c;
    default:
        return 0;
    }
}
