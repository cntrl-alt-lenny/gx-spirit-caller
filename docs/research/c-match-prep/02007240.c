/* CAMPAIGN-PREP candidate for func_02007240 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack buffer (0x400) init via CRC32-poly call + tail call returning r0
 *   risk:       buf alignment/sub-sp size fixed; func_020a66e8 return type assumed int; arg caching r4/r5.
 *   confidence: med
 */
/* func_02007240: allocate a 0x400-byte stack scratch (CRC32 table), init it
 * with func_020a67cc(buf, 0xedb88320) (the reversed CRC-32 polynomial), then
 * compute via func_020a66e8(buf, arg0, arg1) and return its result.
 */
extern void func_020a67cc(void *buf, unsigned int poly);
extern int  func_020a66e8(void *buf, void *a, void *b);

int func_02007240(void *a, void *b) {
    char buf[0x400];
    func_020a67cc(buf, 0xedb88320u);
    return func_020a66e8(buf, a, b);
}
