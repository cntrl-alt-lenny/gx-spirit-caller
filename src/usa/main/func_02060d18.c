/* CAMPAIGN-PREP candidate for func_02060d18 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop; signed-char ldrsb; bind-base + reload-global-on-wrap
 *   risk:       loop-guard hoist (cmp;ble) and i++ scheduling may reorder; data_02101278 element-type (signed char*) guessed
 *   confidence: med
 */
/* func_02060d18: in-place XOR-decrypt of buf[0..len) against a NUL-
 * terminated key string held at the global pointer data_02101278.
 * The key pointer wraps back to the start whenever the next key byte
 * is NUL (asm reloads [&data_02101278] on the zero test).
 */

extern signed char *data_02101278;

void func_02060d18(signed char *buf, int len) {
    signed char *key = data_02101278;
    int i;
    for (i = 0; i < len; i++) {
        buf[i] ^= *key;
        key++;
        if (*key == 0) key = data_02101278;
    }
}
