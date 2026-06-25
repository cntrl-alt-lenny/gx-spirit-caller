/* CAMPAIGN-PREP candidate for func_0201d07c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Single field store (#3 at +0x14) + counted zero-fill (str [base,i,lsl#2])
 *   risk:       data_0218febc treated as int[] so +0x14 is index 5; if it's a struct the offset still resolves to 0x14.
 *   confidence: high
 */
/* func_0201d07c: init clear loop over data array.
 *   *(int*)(data_0218febc + 0x14) = 3;
 *   for (i = 0; i < 0x20; i++) data_0218ff8c[i] = 0;
 */

extern int data_0218febc[];
extern int data_0218ff8c[];

void func_0201d07c(void) {
    int i;
    data_0218febc[0x14 / 4] = 3;
    for (i = 0; i < 0x20; i++) {
        data_0218ff8c[i] = 0;
    }
}
