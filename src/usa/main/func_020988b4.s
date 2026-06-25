; func_020988b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021023dc
        .extern data_021023e0
        .extern func_02094500
        .extern func_02094688
        .extern func_020991e4
        .global func_020988b4
        .arm
func_020988b4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x58
    mov r4, r0
    mov r6, r1
    mov r5, r2
    add r0, sp, #0x4
    mov r1, #0x0
    mov r2, #0x14
    bl func_02094500
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    ldr r2, [r1]
    add r1, sp, #0x18
    bl func_02094688
    ldr r3, _LIT1
    mov r1, r6
    ldr ip, [r3]
    mov r2, r5
    add r0, sp, #0x4
    add r3, sp, #0x18
    str ip, [sp]
    bl func_020991e4
    add r2, sp, #0x4
    mov r3, #0x0
.L_268:
    ldr r1, [r2]
    ldr r0, [r4, r3]
    cmp r1, r0
    bne .L_288
    add r3, r3, #0x4
    cmp r3, #0x14
    add r2, r2, #0x4
    bcc .L_268
.L_288:
    cmp r3, #0x14
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x58
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021023dc
_LIT1: .word data_021023e0
