; func_02051f24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e30c
        .extern func_0204520c
        .extern func_020522c0
        .extern func_02092fc8
        .extern func_02094688
        .global func_02051f24
        .arm
func_02051f24:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    mov r7, r0
    ldr r4, [r3]
    mov r3, #0x30
    mla r4, r7, r3, r4
    mov r6, r1
    mov r5, r2
    bl func_020522c0
    cmp r0, #0x2
    bne .L_6c
    ldr r3, [r4, #0x10]
    ldr r0, [r4, #0x8]
    add r1, r3, r5
    cmp r1, r0
    ble .L_58
    ldr r1, _LIT1
    mov r0, #0x6
    bl func_0204520c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_58:
    ldr r1, [r4, #0x4]
    mov r0, r6
    mov r2, r5
    add r1, r1, r3
    bl func_02094688
.L_6c:
    ldr r0, [r4, #0x10]
    add r0, r0, r5
    str r0, [r4, #0x10]
    ldr r2, [r4, #0x18]
    ldr r0, [r4, #0x10]
    cmp r0, r2
    bne .L_bc
    mov r0, #0x1
    strb r0, [r4, #0x1d]
    mov r1, #0x0
    str r1, [r4, #0x10]
    ldr r0, _LIT0
    str r1, [r4, #0x18]
    ldr r0, [r0]
    ldr r3, [r0, #0x604]
    cmp r3, #0x0
    beq .L_bc
    ldr r1, [r4, #0x4]
    mov r0, r7
    blx r3
.L_bc:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x608]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_02092fc8
    str r0, [r4, #0x24]
    str r1, [r4, #0x28]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_0219e30c
_LIT1: .word 0xfffe82ac
