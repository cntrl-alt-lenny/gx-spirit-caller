/* CAMPAIGN-PREP candidate for func_0208cb88 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT store-order: struct u16 zero-run then absolute MMIO stores
 *   risk:       data_021a6304 modeled as u16[13]; if real struct differs, offsets hold but type may flip strh/str; MMIO store ordering must stay as written
 *   confidence: med
 */
/* func_0208cb88: zero 13 consecutive u16 fields of data_021a6304
 * (offsets 0x00..0x18), then clear a block of sound/MMIO registers
 * at 0x04000244..0x04000249 in store order:
 *   str  [0x04000244] (u32)
 *   strb [0x04000245]
 *   strb [0x04000246]
 *   strh [0x04000248]
 */

extern unsigned short data_021a6304[13];

void func_0208cb88(void) {
    int i;
    for (i = 0; i < 13; i++) {
        data_021a6304[i] = 0;
    }
    *(volatile unsigned int   *)0x04000244 = 0;
    *(volatile unsigned char  *)0x04000245 = 0;
    *(volatile unsigned char  *)0x04000246 = 0;
    *(volatile unsigned short *)0x04000248 = 0;
}
