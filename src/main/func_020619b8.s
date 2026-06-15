; func_020619b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021014e4
        .extern data_021014f4
        .extern func_02064aa0
        .extern func_020a6d54
        .global func_020619b8
        .arm
func_020619b8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r4, r0
    mov r5, r1
    bne .L_4a0
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xd9
    bl func_020a6d54
.L_4a0:
    cmp r4, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, [r4, #0x34]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, pc}
    ldr r1, [r4, #0x24]
    mov r0, r4
    add r1, r1, #0x1
    str r1, [r4, #0x24]
    ldr r3, [r4, #0x8]
    mov r1, r5
    ldr r2, [r3, #0x1c]
    add r2, r2, #0x1
    str r2, [r3, #0x1c]
    ldr r2, [r4, #0x34]
    blx r2
    ldr r0, [r4, #0x24]
    sub r0, r0, #0x1
    str r0, [r4, #0x24]
    ldr r1, [r4, #0x8]
    ldr r0, [r1, #0x1c]
    sub r0, r0, #0x1
    str r0, [r1, #0x1c]
    ldr r0, [r4, #0x8]
    ldr r1, [r0, #0x14]
    cmp r1, #0x0
    beq .L_538
    ldr r1, [r0, #0x1c]
    cmp r1, #0x0
    bne .L_538
    bl func_02064aa0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_538:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021014f4
_LIT1: .word data_021014e4
