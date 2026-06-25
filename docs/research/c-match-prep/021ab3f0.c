/* CAMPAIGN-PREP candidate for func_021ab3f0 (ov022, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain clear/free + bind base; mixed reload
 *   risk:       base bound to r4 across uses but +0x8bc reloads its own pool (data_021abaa0); if mwcc binds that too, one ldr differs.
 *   confidence: med
 */
/* func_ov022_021ab3f0 (ov022) - teardown: two engine resets, then guard-free
 * two cached handles at base+0x874 / base+0x878, then a final shutdown call.
 * Returns 1. base = data_ov022_021abae8. The +0x8bc flag (at
 * data_ov022_021abaa0) gates ONLY the first free. */
extern char data_ov022_021abaa0[];
extern char data_ov022_021abae8[];
extern void func_020058b4(void);
extern void func_02006e1c(int handle);
extern void func_02036590(int a0, int a1);

int func_ov022_021ab3f0(void) {
    char *base = data_ov022_021abae8;
    func_02036590(0x8f00000, 0);
    func_02036590(0x08f00003, 0);
    if (*(int *)(data_ov022_021abaa0 + 0x8bc) != 0) {
        func_02006e1c(*(int *)(base + 0x874));
        *(int *)(base + 0x874) = 0;
    }
    if (*(int *)(base + 0x878) != 0) {
        func_02006e1c(*(int *)(base + 0x878));
        *(int *)(base + 0x878) = 0;
    }
    func_020058b4();
    return 1;
}
