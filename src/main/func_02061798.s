; func_02061798 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021014e4
        .extern data_021014f4
        .extern func_020540d0
        .extern func_02064aa0
        .extern func_020a6d54
        .global func_02061798
        .arm
func_02061798:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bne .L_288
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6d54
.L_288:
    cmp r7, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r7, #0x9c]
    mov r1, r6
    bl func_020540d0
    movs lr, r0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    cmp r4, #0x0
    beq .L_2c4
    cmp r5, #0x0
    bne .L_2cc
.L_2c4:
    mov r5, #0x0
    mov r4, r5
.L_2cc:
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
    beq .L_350
    ldr r1, [r0, #0x1c]
    cmp r1, #0x0
    bne .L_350
    bl func_02064aa0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_350:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021014f4
_LIT1: .word data_021014e4
_LIT2: .word 0x0000012d
