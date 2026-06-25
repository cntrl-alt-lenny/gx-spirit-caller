/* CAMPAIGN-PREP candidate for func_02093014 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     range-clamp range-check + conditional stores + eq-reload init
 *   risk:       mwcc may not fold the [0x2600000,0x2800000) clamp into bcc/ldrcc/strcc with this exact branch shape; the streq pair to two pools and the +0xfdc offset may reorder. GLOBAL_ASM'd already.
 *   confidence: low
 */
/* func_02093014: validate a frequency/size value held at fixed RAM addr
 * 0x027ffd9c. If it is in [0x2600000, 0x2800000) keep it in data_021a6638,
 * else zero that slot. Then, if the slot ended up zero, publish a default:
 * write func_02092e90 both to *(0x027ffd9c) and to *(0x027e3000+0xfdc).
 * Finally clear data_021a6630. Mirrors the original's conditional-store
 * codegen; shipped as whole-function .s (brief 302) because the clamp
 * did not reproduce from C. */

extern int   data_021a6630;
extern int   data_021a6638;
extern void  func_02092e90(void);

void func_02093014(void)
{
    int v = *(volatile int *)0x027ffd9c;

    if (v >= 0x2600000 && v < 0x2800000) {
        data_021a6638 = v;
    } else {
        data_021a6638 = 0;
    }

    if (data_021a6638 == 0) {
        *(volatile int *)0x027ffd9c        = (int)func_02092e90;
        *(volatile int *)(0x027e3000 + 0xfdc) = (int)func_02092e90;
    }

    data_021a6630 = 0;
}
