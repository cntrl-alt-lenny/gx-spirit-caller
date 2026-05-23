/* func_02021b38: initialise a 0x34a8-byte BSS block + per-slot
 * subsystem state.
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     ldr   r4, .L_DATA_A           ; r4 = &data_02197434
 *     ldr   r2, .L_SIZE             ; r2 = 0x34a8
 *     mov   r5, r0                  ; r5 = arg
 *     mov   r1, r4
 *     mov   r0, #0x0
 *     bl    Fill32                  ; Fill32(0, &data_02197434, 0x34a8)
 *     ldr   r0, .L_CFG_TABLE        ; r0 = &data_021040ac
 *     ldr   r2, .L_DATA_B           ; r2 = &data_02198434
 *     ldr   r0, [r0, #0x38]         ; r0 = data_021040ac[14]
 *     str   r5, [r2, #0xb0]         ; data_02198434[44] = arg
 *     mov   r0, r0, lsl #0x10
 *     ldr   r1, .L_DATA_A2          ; r1 = &data_02197434  ← DUPLICATE pool
 *     mov   r0, r0, lsr #0x10       ; r0 = low 16 bits (zero-extended)
 *     str   r0, [r1, #0x4]          ; data_02197434[1] = (u16)cfg
 *     mov   r2, #0x0                ; loop counter i = 0
 *     mvn   r1, #0x0                ; r1 = -1 (C-15: `mvn` form for ~0)
 *   .L_loop:
 *     add   r0, r4, r2, lsl #0x4    ; r0 = &data_02197434[i*4]
 *     add   r2, r2, #0x1            ; i++
 *     str   r1, [r0, #0x48]         ; *(r0 + 0x48) = -1
 *     cmp   r2, #0x100              ; i < 256
 *     blt   .L_loop
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, r4, r5, pc}
 *   .L_DATA_A:    .word data_02197434
 *   .L_SIZE:      .word 0x34a8
 *   .L_CFG_TABLE: .word data_021040ac
 *   .L_DATA_B:    .word data_02198434
 *   .L_DATA_A2:   .word data_02197434           ← DUPLICATE
 *
 * **C-23 wall — duplicate pool reference.** The `data_02197434`
 * symbol appears as TWO separate pool entries (`.L_DATA_A` and
 * `.L_DATA_A2`). mwcc 2.0/sp1p5 would CSE these into a single load;
 * mwcc 1.2/sp2p3 keeps them separate when the function structure
 * forces the second load (here: a quick `+0x4` store sandwiched
 * between the `bl Fill32` and the loop, where the compiler chose
 * scratch r1 for the base rather than reusing callee-saved r4).
 * Route as `.legacy.c`.
 *
 * **C-15 — `mvn r1, #0x0` for the -1 constant.** mwcc 1.2/sp2p3
 * emits `mvn rN, #0` for `~0` / `-1` constants; mwcc 2.0 may emit
 * `mov rN, #-1` (encoded differently). The C source `-1` triggers
 * the mvn form under `.legacy.c` routing.
 *
 * **Style B epilogue** — `ldmia sp!, {r3, r4, r5, pc}` (pop with PC
 * in the regset, no separate `bx lr`). This is mwcc 1.2/sp2p3's
 * default epilogue when interwork isn't required.
 *
 * **`lsl #16; lsr #16` for `(u16)cfg`.** mwcc compiles
 * `(unsigned short)cfg` to a zero-extend via shift pair when there's
 * no direct `ldrh` opportunity (the source value came from an `int`
 * load, not a halfword field).
 */

extern int  data_02197434[];      /* main subsystem work area (0x34a8 B) */
extern int  data_021040ac[];      /* config table — int[] */
extern int  data_02198434[];      /* subsystem secondary state */
extern void Fill32(unsigned int v, void *dst, unsigned int n);

int func_02021b38(int arg) {
    Fill32(0, data_02197434, 0x34a8);
    *(int *)((char *)data_02198434 + 0xb0) = arg;
    *(int *)((char *)data_02197434 + 0x4) = (unsigned short)data_021040ac[14];
    {
        int i;
        for (i = 0; i < 256; i++) {
            *(int *)((char *)data_02197434 + i * 16 + 0x48) = -1;
        }
    }
    return 1;
}
