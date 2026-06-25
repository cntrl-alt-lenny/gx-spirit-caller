/* CAMPAIGN-PREP candidate for func_0209362c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag-guard init (u16) + two zero stores + tail call
 *   risk:       Low — clean shape. mov r0,#0x10 arg set is scheduled before the two stores; if mwcc emits the arg load after the stores objdiff flips one instruction order.
 *   confidence: med
 */
/* func_0209362c: one-shot init guarded by a u16 flag at data_021a66d0.
 * Sets the flag, calls func_02093084, zeroes a two-word block at
 * data_021a66d4, then calls func_020905dc(0x10). Linear store-order init. */

extern unsigned short data_021a66d0;   /* init flag */
extern int            data_021a66d4[2];
extern void           func_020905dc(int);
extern void           func_02093084(void);

void func_0209362c(void)
{
    if (data_021a66d0) return;
    data_021a66d0 = 1;

    func_02093084();

    data_021a66d4[0] = 0;
    data_021a66d4[1] = 0;

    func_020905dc(0x10);
}
