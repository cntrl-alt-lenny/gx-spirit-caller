; func_02070348 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62f0
        .extern func_02070400
        .extern func_020a7294
        .global func_02070348
        .arm
func_02070348:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    mov r2, r0
    ldr r4, [r3, #0x4]
    mov r3, r1
    ldr r5, [r4, #0xa4]
    cmp r5, #0x0
    beq .L_a4
    ldr r4, [r5, #0x60]
    cmp r4, #0x0
    beq .L_8c
    ldr r0, [r5, #0x5c]
    mov r1, r4
    bl func_02070400
    ldr r1, [r5, #0x60]
    mov r4, r0
    cmp r4, r1
    movcs r0, #0x0
    strcs r0, [r5, #0x60]
    addcs sp, sp, #0x4
    subcs r0, r4, r1
    ldmcsia sp!, {r4, r5, lr}
    bxcs lr
    ldr r0, [r5, #0x5c]
    sub r2, r1, r4
    add r1, r0, r4
    bl func_020a7294
    ldr r1, [r5, #0x60]
    add sp, sp, #0x4
    sub r1, r1, r4
    mov r0, #0x0
    str r1, [r5, #0x60]
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_8c:
    mov r2, #0x0
    mov r3, r2
    bl func_02070400
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_a4:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a62f0
