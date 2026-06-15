; func_02061b60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021014e4
        .extern data_021014f4
        .extern func_02064aa0
        .extern func_020a6d54
        .global func_02061b60
        .arm
func_02061b60:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bne .L_650
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x94
    bl func_020a6d54
.L_650:
    cmp r7, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r7, #0x2c]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    cmp r5, #0x0
    beq .L_684
    cmp r6, #0x0
    bne .L_68c
.L_684:
    mov r6, #0x0
    mov r5, r6
.L_68c:
    ldr r1, [r7, #0x24]
    mov r0, r7
    add r1, r1, #0x1
    str r1, [r7, #0x24]
    ldr ip, [r7, #0x8]
    mov r1, r6
    ldr r3, [ip, #0x1c]
    mov r2, r5
    add r3, r3, #0x1
    str r3, [ip, #0x1c]
    ldr r5, [r7, #0x2c]
    mov r3, r4
    blx r5
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
    beq .L_708
    ldr r1, [r0, #0x1c]
    cmp r1, #0x0
    bne .L_708
    bl func_02064aa0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_708:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021014f4
_LIT1: .word data_021014e4
