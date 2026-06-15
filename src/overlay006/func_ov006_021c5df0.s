; func_ov006_021c5df0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021660
        .extern func_020216b0
        .global func_ov006_021c5df0
        .arm
func_ov006_021c5df0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    ldr r4, [sl, #0x4c]
    add r5, sl, #0x6c
    mov r8, #0x0
.L_18:
    cmp r8, #0x0
    moveq r9, #0x20
    movne r9, #0x7
    ldr r0, [sl]
    mov r1, #0x5
    mov r2, r9
    bl func_02021660
    mov r6, r0
    ldr r0, [sl, #0x50]
    cmp r0, #0x0
    beq .L_6c
    ldr r0, [r5, r4, lsl #0x4]
    cmp r0, #0x0
    blt .L_6c
    cmp r0, #0x6
    bge .L_6c
    cmp r8, #0x0
    ldreq r0, _LIT0
    addeq r7, r0, #0x28
    ldrne r7, _LIT0
    b .L_70
.L_6c:
    mov r7, #0x0
.L_70:
    cmp r8, #0x0
    bne .L_9c
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r0, #0x8
    str r0, [sp]
    ldr r1, [r5, r4, lsl #0x4]
    mov r0, #0x16
    mul r0, r1, r0
    add fp, r0, #0x1e
    b .L_b8
.L_9c:
    mov r0, #0xc
    ldr r1, [r5, r4, lsl #0x4]
    str r0, [sp, #0x4]
    str r0, [sp]
    mov r0, #0x16
    mul r0, r1, r0
    add fp, r0, #0x21
.L_b8:
    mov r2, r9
    mov r0, r6
    mov r1, #0x2
    bl func_020216b0
    ldr r2, [sp]
    mov r0, r6
    mov r1, #0x3
    bl func_020216b0
    mov r2, fp
    mov r0, r6
    mov r1, #0x4
    bl func_020216b0
    mov r0, r6
    mov r1, #0x11
    mov r2, #0x3
    bl func_020216b0
    mov r0, r6
    mov r1, #0x12
    mov r2, #0x0
    bl func_020216b0
    mov r0, r6
    mov r1, #0xc
    mov r2, #0x0
    bl func_020216b0
    ldr r2, [sp, #0x4]
    mov r0, r6
    mov r1, #0xd
    bl func_020216b0
    mov r0, r6
    mov r2, r7
    mov r1, #0x0
    bl func_020216b0
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_18
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000001c1
