/* CAMPAIGN-PREP candidate for func_021b8bf4 (ov006, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT Fill32 + counted store loop; nested call; post-inc ptr
 *   risk:       If func_0202b9b0's real param is u16 a narrowing lsl/lsr appears; dst as index vs walking-pointer could flip store addressing.
 *   confidence: med
 */
/* func_ov006_021b8bf4: Fill32-zero a 0x5f0-byte global, then walk a byte
 * output buffer (data_..bee1) for i in [1, count), count = data_020b4768
 * (signed; loop skipped when count<=1). Each byte = func_0202b9b0(
 * func_0202b0e0(i)) — nested, the inner u32 result flows straight into the
 * call (no truncation in the asm, so the inner arg is taken wide). Returns 1.
 * Fill32(value, dst, size): value in r0, dst in r1, size in r2. */

extern void Fill32(int value, void *dst, int size);
extern int data_020b4768;
extern unsigned char data_ov006_0225bee0[];
extern unsigned char data_ov006_0225bee1[];
extern unsigned int func_0202b0e0(int id);
extern int func_0202b9b0(int h);

int func_ov006_021b8bf4(void) {
    int count = data_020b4768;
    unsigned char *dst = data_ov006_0225bee1;
    int i;
    Fill32(0, data_ov006_0225bee0, 0x5f0);
    for (i = 1; i < count; i++) {
        *dst++ = func_0202b9b0(func_0202b0e0(i));
    }
    return 1;
}
