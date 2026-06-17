/* func_0208cb30: C-41 — MMIO bit-clear + tail-call to data-dispatcher.
 *
 * Orig shape (40 B, 7 ARM insns + 3 pool words):
 *
 *     ldr   r2, .L_pool_0              ; r2 = 0x04001000 (DISPCNT MMIO)
 *     ldr   ip, .L_pool_1              ; ip = &func_0208cc7c (helper ptr)
 *     ldr   r1, [r2]                   ; r1 = *MMIO
 *     ldr   r0, .L_pool_2              ; r0 = &data_021a623c (helper arg)
 *     bic   r1, r1, #0x80000000        ; clear bit 31 (BG3 enable bit)
 *     str   r1, [r2]                   ; write back
 *     bx    ip                         ; tail-call helper(arg)
 *     .word 0x04001000
 *     .word func_0208cc7c
 *     .word data_021a623c
 *
 * Brief 235 C-41 recipe — natural `*MMIO &= ~MASK; return helper(arg);`
 * form. mwcc 2.0/sp1p5 emits the orig pattern directly:
 *
 *   - The MMIO read-modify-write through `volatile` produces
 *     `ldr/bic/str`.
 *   - The trailing `return helper(arg)` with externally-pointed
 *     helper + data symbols TCO's into `bx ip` (tail call via
 *     indirect register).
 *
 * Four picks share this shape, varying only the bit-mask (0x80000000
 * or 0x40000000), helper symbol, and data symbol:
 *
 *   - 0208cc18: bic #0x80000000, helper func_0208cc7c, data 021a631c
 *   - 0208cc40: bic #0x40000000, helper func_0208cc7c, data 021a631a
 *   - 0208ce48: bic #0x80000000, helper func_0208ce84, data 021a631c
 *   - 0208ce70: bic #0x40000000, helper func_0208ce84, data 021a631a
 *
 * Pool word 0x04001000 = DISPCNT (DS NDS9 display control register).
 *
 * Brief 235 piloted the broader 0x04001xxx pool corpus and found
 * this is a coherent shape-family with one recipe. Other broader
 * picks (MMIO conditional dispatch, switch-tables, multi-step
 * read/write) are heterogeneous and need per-pick recipes.
 *
 * Routing: plain `.c` (mwcc 2.0/sp1p5). See
 * `docs/research/brief-235-c39e-c40-broader-and-232-deferred.md`.
 */

#define DISPCNT (*(volatile unsigned int *)0x04001000)

extern int func_0208cc7c(void *arg);
extern char data_021a623c[];

int func_0208cb30(void) {
    DISPCNT &= ~0x80000000;
    return func_0208cc7c(data_021a623c);
}
