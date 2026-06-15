; func_020497a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff960
        .extern data_020ff964
        .extern func_02045b1c
        .extern func_020488f4
        .extern func_020aadf8
        .extern func_020acca0
        .global func_020497a8
        .arm
func_020497a8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x218
    mov r6, r1
    add r1, sp, #0x4
    mov r4, r2
    mov r5, r3
    bl func_020488f4
    cmp r0, #0x0
    beq .L_23c
    ldr r0, [sp, #0x8]
    cmp r0, #0x6
    bne .L_200
    cmp r6, #0x0
    beq .L_1bc
    ldr r0, _LIT0
    add r1, sp, #0x0
    add r2, sp, #0xc
    mov r3, #0x2f
    bl func_02045b1c
    cmp r0, #0x0
    movle r0, #0x0
    strleb r0, [r6]
    ble .L_1bc
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0xa
    bl func_020acca0
    strb r0, [r6]
.L_1bc:
    cmp r4, #0x0
    beq .L_218
    ldr r0, _LIT1
    add r1, sp, #0x0
    add r2, sp, #0xc
    mov r3, #0x2f
    bl func_02045b1c
    cmp r0, #0x0
    movle r0, #0x0
    strleb r0, [r4]
    ble .L_218
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0xa
    bl func_020acca0
    strb r0, [r4]
    b .L_218
.L_200:
    cmp r6, #0x0
    movne r0, #0x0
    strneb r0, [r6]
    cmp r4, #0x0
    movne r0, #0x0
    strneb r0, [r4]
.L_218:
    cmp r5, #0x0
    beq .L_22c
    add r1, sp, #0x10c
    mov r0, r5
    bl func_020aadf8
.L_22c:
    ldr r0, [sp, #0x8]
    add sp, sp, #0x218
    and r0, r0, #0xff
    ldmia sp!, {r4, r5, r6, pc}
.L_23c:
    cmp r6, #0x0
    movne r0, #0x0
    strneb r0, [r6]
    cmp r4, #0x0
    movne r0, #0x0
    strneb r0, [r4]
    mov r0, #0x0
    add sp, sp, #0x218
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020ff960
_LIT1: .word data_020ff964
