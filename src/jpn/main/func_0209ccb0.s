; func_0209ccb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a83e0
        .extern func_0209d05c
        .extern func_0209d0fc
        .global func_0209ccb0
        .arm
func_0209ccb0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov sl, r0
    ldr r9, _LIT0
    add r7, sl, #0x20
    ldr r5, _LIT1
    ldr r6, _LIT2
    mov fp, #0x0
    mov r0, #0x200
    rsb r4, r0, #0x0
.L_28:
    ldr r0, [r9, #0x1c]
    and r1, r0, r4
    cmp r1, r0
    bne .L_50
    ldr r8, [r9, #0x20]
    ands r0, r8, #0x3
    bne .L_50
    ldr r0, [r9, #0x24]
    cmp r0, #0x200
    bcs .L_58
.L_50:
    mov r8, r7
    str r1, [sl, #0x8]
.L_58:
    mov r0, r1, lsr #0x8
    orr r0, r0, #-1224736768
    mov r1, r1, lsl #0x18
    bl func_0209d05c
    ldr r1, [sl, #0x4]
    mov r0, fp
    str r1, [r6]
.L_74:
    ldr r2, [r6]
    ands r1, r2, #0x800000
    beq .L_90
    ldr r1, [r5]
    cmp r0, #0x200
    strcc r1, [r8, r0, lsl #0x2]
    addcc r0, r0, #0x1
.L_90:
    ands r1, r2, #-2147483648
    bne .L_74
    ldr r0, [r9, #0x20]
    cmp r8, r0
    bne .L_d8
    ldr r2, [r9, #0x1c]
    ldr r1, [r9, #0x20]
    ldr r0, [r9, #0x24]
    add r2, r2, #0x200
    add r1, r1, #0x200
    subs r0, r0, #0x200
    str r2, [r9, #0x1c]
    str r1, [r9, #0x20]
    str r0, [r9, #0x24]
    bne .L_28
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_d8:
    mov r0, sl
    bl func_0209d0fc
    cmp r0, #0x0
    bne .L_28
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021a83e0
_LIT1: .word 0x04100010
_LIT2: .word 0x040001a4
