/* CAMPAIGN-PREP candidate for func_0206e670 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     big-endian 32-bit store, 4 byte stores via lsr shifts
 *   risk:       none; explicit byte writes MSB-first map 1:1 to mov lsr/strb
 *   confidence: high
 */
/* func_0206e670: store a 32-bit word big-endian into a byte buffer.
 *   dst[0] = (u8)(v >> 24);
 *   dst[1] = (u8)(v >> 16);
 *   dst[2] = (u8)(v >> 8);
 *   dst[3] = (u8) v;
 */

void func_0206e670(unsigned int v, unsigned char *dst) {
    dst[0] = (unsigned char)(v >> 24);
    dst[1] = (unsigned char)(v >> 16);
    dst[2] = (unsigned char)(v >> 8);
    dst[3] = (unsigned char)v;
}
