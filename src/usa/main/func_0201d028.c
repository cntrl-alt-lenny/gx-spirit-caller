/* CAMPAIGN-PREP candidate for func_0201d028 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Single field store (#3 at +0x14) + counted zero-fill (str [base,i,lsl#2])
 *   risk:       data_0218fddc treated as int[] so +0x14 is index 5; if it's a struct the offset still resolves to 0x14.
 *   confidence: high
 */
/* func_0201d028: init clear loop over data array.
 *   *(int*)(data_0218fddc + 0x14) = 3;
 *   for (i = 0; i < 0x20; i++) data_0218feac[i] = 0;
 */

extern int data_0218fddc[];
extern int data_0218feac[];

void func_0201d028(void) {
    int i;
    data_0218fddc[0x14 / 4] = 3;
    for (i = 0; i < 0x20; i++) {
        data_0218feac[i] = 0;
    }
}
