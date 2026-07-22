extern int func_ov002_021f60fc(void *);
extern void func_ov002_021d91e0(int, int, int);

/* func_ov002_021f8244: 2-early-return shape (call-guard, then optional
 * second call) with 2 SEPARATE ldmia epilogues in the original. mwcc
 * always collapses this under -O4 to one shared epilogue with predicated
 * r0 (see func_ov002_021e2e18) regardless of C-level restructuring.
 * Shipped as asm int to match exactly.
 */
asm int func_ov002_021f8244(void *p) {
    nofralloc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_021f60fc
    cmp r0, #0x0
    beq lbl_ret0
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne lbl_ret1
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, #0x3
    bl func_ov002_021d91e0
lbl_ret1:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
lbl_ret0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
}
