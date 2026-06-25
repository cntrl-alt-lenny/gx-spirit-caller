/* CAMPAIGN-PREP candidate for func_0207b230 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store 32-bit constant 0xaaa082 into field at +0x2264
 *   risk:       struct offset 0x2264 guessed; the literal 0xaaa082 must land in the pool (it will) — main risk is the field offset vs the real struct
 *   confidence: high
 */
/* func_0207b230: write the constant 0x00AAA082 into the global singleton's
 * field at byte offset 0x2264.
 *
 *   ldr base; ldr [base]; add #0x2000; str #0xaaa082 -> [.,#0x264]
 *   -> (*data_021a088c)->field_2264 = 0xaaa082;
 */

typedef struct {
    char _pad[0x2264];
    int field_2264;   /* +0x2264 */
} Singleton3;

extern Singleton3 *data_021a088c;

void func_0207b230(void) {
    data_021a088c->field_2264 = 0xaaa082;
}
