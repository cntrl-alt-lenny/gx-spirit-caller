/* CAMPAIGN-PREP candidate for func_0204b3d0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf scan loop, mul stride, masked early return
 *   risk:       i*0xc stride may strength-reduce to pointer-bump; (i+0x64)&0xff masking
 *   confidence: med
 */
/* func_0204b3d0: scan i in [0,0x9a): if *(u8)(base + i*0xc) == 0
 *   return (i + 0x64) & 0xff;  else continue. Fall through -> 0.
 * Base data_0219dcb4; index counter masked &0xff each step (matches and r3,#0xff). */

extern unsigned char data_0219dcb4[];

int func_0204b3d0(void) {
    int i = 0;
    do {
        if (data_0219dcb4[i * 0xc] == 0)
            return (i + 0x64) & 0xff;
        i = (i + 1) & 0xff;
    } while (i < 0x9a);
    return 0;
}
