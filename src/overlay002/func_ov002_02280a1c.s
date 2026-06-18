; func_ov002_02280a1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_0227b090
        .global func_ov002_02280a1c
        .arm
func_ov002_02280a1c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov sl, r0
    ldr r5, _LIT0
    ldr r0, _LIT1
    and r4, sl, #0x1
    mla r6, r4, r0, r5
    mov r4, #0x0
    mov r8, r2
    mov r9, r1
    str r4, [r8]
    mov r7, r3
    str r4, [r9]
    add r5, r6, #0x30
    add fp, sp, #0x0
.L_3c:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_98
    ldrh r0, [r6, #0x38]
    cmp r0, #0x0
    bne .L_60
    cmp r7, #0x0
    bne .L_98
.L_60:
    mov r0, sl
    mov r1, r4
    mov r2, fp
    bl func_ov002_0227b090
    ldr r0, [sp, #0x14]
    ldr r1, [r9]
    cmp r1, r0
    movle r1, r0
    str r1, [r9]
    ldr r0, [sp, #0x18]
    ldr r1, [r8]
    cmp r1, r0
    movle r1, r0
    str r1, [r8]
.L_98:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r5, r5, #0x14
    add r6, r6, #0x14
    blt .L_3c
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
