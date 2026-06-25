/* CAMPAIGN-PREP candidate for func_020931f8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag-guard halfword init + ordered MMIO/global stores + 2 calls
 *   risk:       Store interleave (data_021a66c8._0 / _4, then DISPCNT 0x4000100/0102 halfwords, then func ptr) and the r3-base-held-across-stores reg-alloc may reorder; halfword vs word store widths must hold.
 *   confidence: med
 */
/* func_020931f8: one-shot init guarded by a u16 flag at data_021a66c0.
 * Calls func_02093084, zeroes a two-word block at data_021a66c8, writes
 * two display MMIO halfwords (0x04000100, 0x04000102) and stores a
 * function pointer (func_02093160) + control word 0xc1, then kicks two
 * configure calls with arg 8 (func_020907b4, func_02090624) and clears
 * data_021a66c4. Store order preserved to match the original. */

extern unsigned short data_021a66c0;   /* init flag */
extern int            data_021a66c4;
extern int            data_021a66c8[2];
extern void           func_02090624(int);
extern void           func_020907b4(int);
extern void           func_02093084(void);
extern void           func_02093160(void);

void func_020931f8(void)
{
    if (data_021a66c0) return;
    data_021a66c0 = 1;

    func_02093084();

    data_021a66c8[0] = 0;
    data_021a66c8[1] = 0;

    *(volatile unsigned short *)0x04000100 = (unsigned short)(int)func_02093160;
    *(volatile unsigned short *)0x04000102 = 0;
    *(volatile unsigned short *)0x04000102 = 0xc1;

    func_020907b4(8);
    func_02090624(8);

    data_021a66c4 = 0;
}
