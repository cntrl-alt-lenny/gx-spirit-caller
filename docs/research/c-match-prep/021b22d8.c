/* CAMPAIGN-PREP candidate for func_021b22d8 (ov016, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Straight-line init, long fixed call/MMIO sequence
 *   risk:       ASM IS TRUNCATED (no epilogue/return shown); tail calls after func_0208d030 unknown, so the function body is incomplete
 *   confidence: low
 */
/* func_ov007_021b22d8: flat screen/BG init. NOTE: the provided target asm is
 * truncated after `bl func_0208d030` (no epilogue), so this reproduces only the
 * visible call sequence. The real function continues past this point.
 *
 * Visible sequence:
 *   func_02094504(0xc0, 0x7000000, 0x400)
 *   func_02094504(0xc0, data_02103da0, 0x400)
 *   func_02094504(0, 0x5000000, 0x400)
 *   func_02094504(0, data_020c3e48, 0x400)
 *   func_0200592c()
 *   func_0208d1e4(data_ov007_021b3488)
 *   func_02094504(0, 0x6800000, 0xa4000)
 *   func_0208cc90(); func_0208da2c(0x60); func_0208d4f0(3);
 *   func_0208d3fc(0x10); func_0208d138(4); func_0208d0bc(8); func_0208d030(0x80)
 */

extern void func_02094504(int a, int b, int c);
extern void func_0200592c(void);
extern void func_0208d1e4(void *a);
extern void func_0208cc90(void);
extern void func_0208da2c(int a);
extern void func_0208d4f0(int a);
extern void func_0208d3fc(int a);
extern void func_0208d138(int a);
extern void func_0208d0bc(int a);
extern void func_0208d030(int a);
extern char data_02103da0[];
extern char data_020c3e48[];
extern char data_ov007_021b3488[];

void func_ov007_021b22d8(void) {
    func_02094504(0xc0, 0x7000000, 0x400);
    func_02094504(0xc0, (int)data_02103da0, 0x400);
    func_02094504(0x0, 0x5000000, 0x400);
    func_02094504(0x0, (int)data_020c3e48, 0x400);
    func_0200592c();
    func_0208d1e4(data_ov007_021b3488);
    func_02094504(0x0, 0x6800000, 0xa4000);
    func_0208cc90();
    func_0208da2c(0x60);
    func_0208d4f0(0x3);
    func_0208d3fc(0x10);
    func_0208d138(0x4);
    func_0208d0bc(0x8);
    func_0208d030(0x80);
    /* ... target asm truncated here; remainder of body not reproduced ... */
}
