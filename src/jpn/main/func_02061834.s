; func_02061834 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101404
        .extern data_02101414
        .extern func_0205405c
        .extern func_02064a2c
        .extern func_020a6c60
        .global func_02061834
        .arm
func_02061834:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bne .L_268
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6c60
.L_268:
    cmp r7, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r7, #0x98]
    mov r1, r6
    bl func_0205405c
    movs lr, r0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    cmp r4, #0x0
    beq .L_2a4
    cmp r5, #0x0
    bne .L_2ac
.L_2a4:
    mov r5, #0x0
    mov r4, r5
.L_2ac:
    ldr r0, [r7, #0x24]
    ldr r2, [sp, #0x18]
    add r0, r0, #0x1
    str r0, [r7, #0x24]
    ldr ip, [r7, #0x8]
    mov r0, r7
    ldr r3, [ip, #0x1c]
    mov r1, r6
    add r3, r3, #0x1
    str r3, [ip, #0x1c]
    str r2, [sp]
    ldr r6, [lr]
    mov r2, r5
    mov r3, r4
    blx r6
    ldr r0, [r7, #0x24]
    sub r0, r0, #0x1
    str r0, [r7, #0x24]
    ldr r1, [r7, #0x8]
    ldr r0, [r1, #0x1c]
    sub r0, r0, #0x1
    str r0, [r1, #0x1c]
    ldr r0, [r7, #0x8]
    ldr r1, [r0, #0x14]
    cmp r1, #0x0
    beq .L_330
    ldr r1, [r0, #0x1c]
    cmp r1, #0x0
    bne .L_330
    bl func_02064a2c
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_330:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02101414
_LIT1: .word data_02101404
_LIT2: .word 0x00000101
