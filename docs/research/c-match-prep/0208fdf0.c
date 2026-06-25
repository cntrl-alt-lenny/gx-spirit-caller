/* CAMPAIGN-PREP candidate for func_0208fdf0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-branch + literal-pool base + operand-order (off first) + bind-vs-reload
 *   risk:       explicitly reg-alloc-walled before; mwcc may permute r3/r4/lr/ip regs even if the operand order matches
 *   confidence: low
 */
/* func_0208fdf0 — threshold dispatch wrapper, base from a literal pool
 * (0x07000400, not an ARM rotated immediate so mwcc emits ldr).
 * COMMUTATIVE/OPERAND-ORDER lever: the asm forms the source as `add rX, lr, rY`
 * i.e. off + 0x07000400 (offset operand FIRST) to pick the dest reg, so write
 * `off + 0x07000400`, not `0x07000400 + off`. Threshold len > 0x30.
 * Note: this addr already ships as a GLOBAL_ASM .s (reg-alloc-walled, brief 302).
 */

extern int data_0210249c;
extern void func_02094030(int n, void *dst, int src, int len);
extern void Copy32(void *dst, int src, int len);

void func_0208fdf0(void *dst, int off, int len) {
    int g = data_0210249c;
    if (g != -1 && len > 0x30) {
        func_02094030(g, dst, off + 0x07000400, len);
        return;
    }
    Copy32(dst, off + 0x07000400, len);
}
