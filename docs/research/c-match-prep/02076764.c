/* CAMPAIGN-PREP candidate for func_02076764 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     three slot-builder calls into one buffer then bulk commit
 *   risk:       &buf[0x10]/[0x20] index math could fold differently; ctx reused 4x -> r4 (expected)
 *   confidence: high
 */
/* func_02076764: build three 0x10-byte records from three templates into
 * a 0x30 scratch, then commit the whole block via func_02094688.
 */
extern unsigned char data_02101f28[];   /* template 0 */
extern unsigned char data_02101f2c[];   /* template 1 */
extern unsigned char data_02101f30[];   /* template 2 */
extern void func_020767c8(void *dst, const void *tmpl, void *ctx);
extern void func_02094688(void *dst, void *src, int n);

void func_02076764(void *ctx) {
    unsigned char buf[0x30];
    func_020767c8(&buf[0x00], data_02101f28, ctx);
    func_020767c8(&buf[0x10], data_02101f2c, ctx);
    func_020767c8(&buf[0x20], data_02101f30, ctx);
    func_02094688(buf, ctx, 0x30);
}
