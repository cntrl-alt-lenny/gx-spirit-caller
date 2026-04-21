/* func_ov007_021b2ce8: global-table indexed getter (stride 0x20).
 *
 *     ldr r0, .L_021b2cf4          ; base = &data_ov007_021b30bc
 *     ldr r0, [r0, r1, lsl #0x5]   ; r0 = *(int *)(base + idx * 0x20)
 *     bx  lr
 * .L_021b2cf4: .word data_ov007_021b30bc
 *
 * Reads the first int of row `idx` in a 0x20-byte-per-row table at
 * `data_ov007_021b30bc`. The first arg in r0 is unused at entry
 * (mwcc overwrites it with the pool load). The idx lives in r1,
 * confirming a 2-arg signature — this is a callback slot the single
 * caller invokes with its own context in r0.
 */

extern char data_ov007_021b30bc[];

int func_ov007_021b2ce8(int _ctx, int idx) {
    (void)_ctx;
    return *(int *)(data_ov007_021b30bc + idx * 0x20);
}
