; func_02076284 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207634c
        .extern func_02076434
        .extern func_02094688
        .extern func_020a7440
        .global func_02076284
        .arm
func_02076284:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r5, r0
    mov r4, r1
    add r0, r5, #0x3a4
    add r1, r5, #0x3fc
    mov r2, #0x58
    bl func_02094688
    add r1, sp, #0x0
    mov r0, r5
    mov r2, #0x1
    bl func_02076434
    add r0, r5, #0x3fc
    add r1, r5, #0x3a4
    mov r2, #0x58
    bl func_02094688
    add r1, sp, #0x0
    mov r0, r4
    mov r2, #0x10
    bl func_020a7440
    cmp r0, #0x0
    movne r0, #0x9
    addne sp, sp, #0x14
    strneb r0, [r5, #0x455]
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    add r0, r5, #0x2ec
    add r1, r5, #0x348
    mov r2, #0x5c
    bl func_02094688
    add r1, sp, #0x0
    mov r0, r5
    mov r2, #0x1
    bl func_0207634c
    add r0, r5, #0x348
    add r1, r5, #0x2ec
    mov r2, #0x5c
    bl func_02094688
    add r1, sp, #0x0
    add r0, r4, #0x10
    mov r2, #0x14
    bl func_020a7440
    cmp r0, #0x0
    movne r0, #0x9
    strneb r0, [r5, #0x455]
    moveq r0, #0x6
    streqb r0, [r5, #0x455]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, lr}
    bx lr
