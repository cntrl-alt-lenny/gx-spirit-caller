/* CAMPAIGN-PREP candidate for func_0203cb90 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Range-clamp accessor; predicated ldr chain; default-255 if-guard
 *   risk:       bcc/ls => unsigned 10..16 range; ldrlsb signed byte at +0x17; global double-deref
 *   confidence: med
 */
/* func_0203cb90: ranged accessor with 0xff default.
 *  r4=0xff; s=func_0203c888();
 *  if(s>=0xa && s<=0x10) r4 = (*data_0219d9c8)->f_17 (signed byte)
 *  return r4;
 * Predicated loads (cmp/bcc/ldrls) come from the &&-range guard;
 * the global is double-dereferenced (ldr base, ldr [base], ldrsb).
 */
extern signed char **data_0219d9c8;   /* ptr-to-ptr; *data -> struct base */
extern unsigned int func_0203c888(void);

int func_0203cb90(void) {
    int r = 0xff;
    unsigned int s = func_0203c888();
    if (s >= 0xa && s <= 0x10) {
        signed char *base = *data_0219d9c8;
        r = base[0x17];
    }
    return r;
}
