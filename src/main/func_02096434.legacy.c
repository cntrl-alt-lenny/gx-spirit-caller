/* func_02096434: write a per-slot value AND mirror its truthiness as a
 * bit in the OS IRQ-state word at 0x027fff88 (DTCM-resident OS work
 * area, 904 bytes into the kernel block at 0x027ffc00).
 *
 *     stmdb sp!, {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     mov   r4, r0                ; r4 = slot
 *     mov   r5, r1                ; r5 = value
 *     bl    OS_DisableIrq         ; mask in r0 (caller-saved, preserved
 *                                 ;   through body — no clobber)
 *     ldr   r1, .L_SLOT_TABLE     ; r1 = &data_021a8288
 *     cmp   r5, #0
 *     str   r5, [r1, r4, lsl #2]  ; slot_table[slot] = value
 *     beq   .L_clear
 *   .L_set:
 *     ldr   r3, .L_OS_KERNEL_BLOCK_A   ; r3 = 0x027ffc00  ← FIRST pool load
 *     mov   r1, #0x1
 *     ldr   r2, [r3, #0x388]      ; r2 = *(0x027fff88)
 *     orr   r1, r2, r1, lsl r4    ; r1 = r2 | (1 << slot)
 *     str   r1, [r3, #0x388]
 *     b     .L_restore
 *   .L_clear:
 *     ldr   r3, .L_OS_KERNEL_BLOCK_B   ; r3 = 0x027ffc00  ← SECOND pool load
 *     mov   r1, #0x1                   ;     (C-23: mwcc 2.0 would fold this
 *                                       ;      into a single base load before
 *                                       ;      cmp; 1.2/sp2p3 keeps them split)
 *     mvn   r1, r1, lsl r4          ; r1 = ~(1 << slot)
 *     ldr   r2, [r3, #0x388]
 *     and   r1, r2, r1              ; r1 = r2 & ~(1 << slot)
 *     str   r1, [r3, #0x388]
 *   .L_restore:
 *     bl    OS_RestoreIrq           ; r0 still holds the OG OS_DisableIrq mask
 *     add   sp, sp, #0x4
 *     ldmfd sp!, {r4, r5, lr}
 *     bx    lr
 *   .L_SLOT_TABLE:        .word data_021a8288
 *   .L_OS_KERNEL_BLOCK_A: .word 0x027ffc00
 *   .L_OS_KERNEL_BLOCK_B: .word 0x027ffc00
 *
 * 27 insns + 3 pool words = 0x6c bytes.
 *
 * **C-23 wall (brief 199 worked example):** the function loads
 * `0x027ffc00` from TWO separate pool words — once in the SET branch,
 * once in the CLEAR branch. mwcc 2.0/sp1p5's MMIO base-folding peephole
 * would emit a single pool load before the `cmp r5, #0` and share `r3`
 * across both branches. mwcc 1.2/sp2p3 preserves the per-branch reloads
 * — that's the route the orig was built with. The brief 086 worked
 * example (`func_0208bde0`) shipped via the same `.legacy.c` route.
 *
 * **`mvn r1, r1, lsl r4` (single inline-shift instruction) for `~(1 <<
 * slot)`:** mwcc 1.2/sp2p3's inline-shift peephole. The C `~(1U <<
 * slot)` expression compiles to this. (mwcc 2.0 would emit
 * `bic r1, r2, r1, lsl r4` and skip the intermediate load — different
 * shape; same C source, peephole-driven divergence.)
 *
 * **Hybrid prologue/epilogue:** `sub sp, sp, #0x4` prologue + Style A
 * `pop; bx lr` epilogue. This shape is what mwcc 1.2/sp2p3 emits for
 * functions whose call layout needs a stack scratch slot. Routing as
 * `*.legacy.c` (not `*.legacy_sp3.c`) is the canonical choice — see
 * brief 086 / C-23 SP-boundary table for the empirical mapping.
 *
 * Companion ops: `data_021a8288` is a 32-slot BSS int array of
 * per-slot values; the bit at `*(0x027fff88) bit slot` mirrors whether
 * the corresponding slot is non-zero. Likely a system-mode flag table
 * (slots 0..31 each map to a subsystem on/off bit). Naming the table /
 * slots is deferred to a later rename brief.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern int  data_021a8288[];

void func_02096434(int slot, int value) {
    /* `volatile int *block` materialises 0x027ffc00 into a register
     * before the offset access — keeps mwcc 1.2/sp2p3 from constant-
     * folding `0x027ffc00 + 0x388` into a single 0x027fff88 pool word.
     * The orig has TWO `ldr r3, =0x027ffc00; ldr/str [r3, #0x388]`
     * sequences, one per if/else branch, both pointing at the SAME
     * pool word. That's the C-23 shape we need to reproduce. */
    volatile int *block = (volatile int *)0x027ffc00;
    int mask = OS_DisableIrq();
    data_021a8288[slot] = value;
    if (value != 0) {
        block[226] = block[226] | (1U << slot);   /* 226 * 4 = 0x388 */
    } else {
        block[226] = block[226] & ~(1U << slot);
    }
    OS_RestoreIrq(mask);
}
