; func_020967bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020965ac
        .extern func_020970a8
        .global func_020967bc
        .arm
func_020967bc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r5, r0
    ldr r1, [r5, #0x8]
    ldr r4, [r5, #0x34]
    ldr r0, [r1, #0x30]
    mov r2, r4, lsl #0x3
    cmp r2, r0
    addcs sp, sp, #0x14
    movcs r0, #0x1
    ldmcsia sp!, {r4, r5, lr}
    bxcs lr
    str r1, [sp, #0x8]
    ldr r1, [r1, #0x2c]
    add r0, sp, #0x8
    add r3, r1, r2
    add r1, sp, #0x0
    mov r2, #0x8
    str r3, [sp, #0xc]
    bl func_020970a8
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    ldr r1, [sp]
    mov r0, r5
    str r1, [r5, #0x30]
    ldr r2, [sp, #0x4]
    mov r1, #0x7
    str r2, [r5, #0x34]
    str r4, [r5, #0x38]
    bl func_020965ac
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, lr}
    bx lr
