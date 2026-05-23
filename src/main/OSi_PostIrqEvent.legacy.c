/* OSi_PostIrqEvent: pop one entry from the irq-event queue at slot `idx`.
 * Calls the registered callback (if any), sets the OS-tracked bit at
 * `0x027e3ff8` (DTCM kernel IRQ state), then either returns the
 * post-action flag (when non-zero) or hands off to func_020905dc(mask).
 *
 *     stmdb sp!, {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     mov   r1, #0xc
 *     mul   r4, r0, r1               ; r4 = idx * 12  (struct stride)
 *     ldr   r2, .L_CB_TABLE          ; r2 = &data_021a6354
 *     ldr   r3, .L_SHIFT_TABLE       ; r3 = &data_021024a0
 *     mov   r0, r0, lsl #0x1         ; r0 = idx * 2  (u16 stride)
 *     ldr   r1, [r2, r4]             ; r1 = callbacks[idx]
 *     ldrh  r3, [r3, r0]             ; r3 = shift_table[idx]
 *     mov   r5, #0x1
 *     mov   r0, #0x0
 *     str   r0, [r2, r4]             ; callbacks[idx] = 0
 *     cmp   r1, #0x0
 *     mov   r5, r5, lsl r3           ; r5 = 1 << shift
 *     beq   .L_after_cb
 *     ldr   r0, .L_ARG_TABLE         ; r0 = &data_021a635c
 *     ldr   r0, [r0, r4]             ; r0 = args[idx]
 *     blx   r1                       ; cb(arg) — callback may be Thumb
 *   .L_after_cb:
 *     ldr   r0, .L_DTCM_BASE         ; r0 = 0x027e0000
 *     ldr   r1, .L_FLAG_TABLE        ; r1 = &data_021a6358
 *     add   r0, r0, #0x3000          ; r0 = 0x027e3000  (split for ldr imm)
 *     ldr   r2, [r0, #0xff8]         ; r2 = *(0x027e3ff8)
 *     orr   r2, r2, r5
 *     str   r2, [r0, #0xff8]         ; *(0x027e3ff8) |= mask
 *     ldr   r0, [r1, r4]             ; r0 = flags[idx]
 *     cmp   r0, #0x0
 *     addne sp, sp, #0x4
 *     ldmneia sp!, {r4, r5, lr}
 *     bxne  lr                       ; return flags[idx] if nonzero
 *     mov   r0, r5
 *     bl    func_020905dc            ; else hand off to dispatch
 *     add   sp, sp, #0x4
 *     ldmfd sp!, {r4, r5, lr}
 *     bx    lr
 *   .L_CB_TABLE:    .word data_021a6354
 *   .L_SHIFT_TABLE: .word data_021024a0
 *   .L_ARG_TABLE:   .word data_021a635c
 *   .L_DTCM_BASE:   .word 0x027e0000
 *   .L_FLAG_TABLE:  .word data_021a6358
 *
 * **C-23 wall — clustered pool window.** The three pool words
 * `data_021a6354 / data_021a6358 / data_021a635c` are 4 B apart but
 * orig keeps them as THREE separate pool entries (one base load each).
 * mwcc 2.0/sp1p5 would fold these into a single `ldr base; ldr/str
 * [base, #4/#8/#12]` form (base-folding peephole); mwcc 1.2/sp2p3
 * lacks the peephole. Route as `.legacy.c`.
 *
 * **Source-shape rule (brief 199 recipe):** declare each clustered
 * symbol as its own `extern <T> <name>[]` and use BYTE-OFFSET indexing
 * (`&data_021a6354[idx * 12]`) so mwcc emits `mul #12` directly instead
 * of `mul #3; lsl #2`. The byte-offset register `r4 = idx * 12` is then
 * shared across all three table accesses (orig pattern).
 *
 * **DTCM IRQ state at `0x027e3ff8`.** The `add r0, #0x3000; ldr [r0,
 * #0xff8]` split is forced by ARM's 12-bit ldr-offset limit (0xff8 is
 * the largest valid immediate; the remaining 0x3000 has to be added
 * separately). C source uses the small base `(volatile int *)0x027e0000`
 * + a large array index — mwcc picks the same split.
 *
 * **`blx r1` for the callback** — the registered callback may be Thumb.
 * mwcc emits `blx` for an indirect call through a function pointer.
 *
 * **`addne / ldmneia / bxne` predicated-return chain** — mwcc 1.2/sp2p3's
 * natural shape for `if (...) return v;` followed by a fall-through call.
 *
 * **Reg-alloc trigger — `int mask = 1 << shift;` MUST be a single
 * expression.** With `int mask = 1; ...; mask <<= shift;` (two-statement
 * form), mwcc allocates a scratch register for the `1` constant and r5
 * receives the shift result only at the end — diverging from orig.
 * Writing it as `1 << data_021024a0[idx]` (load + shift inline) anchors
 * `mask` in callee-saved r5 from the first use, matching orig.
 */

typedef void (*OSi_IrqHandler)(int arg);

extern unsigned char  data_021a6354[];      /* irq callback table, stride 12 */
extern unsigned char  data_021a6358[];      /* irq post-action flag table */
extern unsigned char  data_021a635c[];      /* irq callback-arg table */
extern unsigned short data_021024a0[];      /* slot → bit-shift table */
extern int            func_020905dc(int mask);

int OSi_PostIrqEvent(int idx) {
    int off = idx * 12;
    int mask = 1 << data_021024a0[idx];
    OSi_IrqHandler cb = *(OSi_IrqHandler *)&data_021a6354[off];
    *(int *)&data_021a6354[off] = 0;
    if (cb != 0) {
        cb(*(int *)&data_021a635c[off]);
    }
    {
        volatile int *block = (volatile int *)0x027e0000;
        block[0xffe] = block[0xffe] | mask;
    }
    {
        int v = *(int *)&data_021a6358[off];
        if (v != 0) return v;
    }
    return func_020905dc(mask);
}
