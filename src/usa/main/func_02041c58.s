; func_02041c58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe710
        .extern data_020fe72c
        .extern data_020fe8c8
        .extern func_02092660
        .extern func_020926d0
        .extern func_020aace8
        .extern func_020aafd0
        .extern func_020acd0c
        .global func_02041c58
        .arm
func_02041c58:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r0
    add r0, r5, #0x1000
    ldr r6, [r0, #0xa04]
    ldr r2, _LIT0
    ldr r1, _LIT1
    mov r0, r6
    add r4, r5, r2
    bl func_020aafd0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r1, _LIT1
    mov r0, r6
    bl func_020aafd0
    ldr r1, _LIT2
    add r6, r0, #0x4
    add r0, r5, r1
    bl func_020926d0
    ldr r0, [r4, #0x4]
    ldr r1, _LIT2
    sub r2, r0, r6
    add r0, r5, #0x1000
    str r2, [r0, #0xa30]
    add r0, r5, r1
    bl func_02092660
    ldr r0, [r4]
    ldr r1, _LIT3
    bl func_020aafd0
    movs r4, r0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, _LIT3
    bl func_020aace8
    add r7, r4, r0
    ldr r1, _LIT4
    mov r0, r7
    bl func_020aafd0
    mov r4, r0
    ldr r0, _LIT2
    ldrsb r6, [r4]
    mov r1, #0x0
    add r0, r5, r0
    strb r1, [r4]
    bl func_020926d0
    mov r0, r7
    bl func_020acd0c
    add r1, r5, #0x1000
    ldr r2, _LIT2
    str r0, [r1, #0xa2c]
    add r0, r5, r2
    bl func_02092660
    strb r6, [r4]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x00001a04
_LIT1: .word data_020fe710
_LIT2: .word 0x00001a14
_LIT3: .word data_020fe8c8
_LIT4: .word data_020fe72c
