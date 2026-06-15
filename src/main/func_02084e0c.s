; func_02084e0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a4820
        .extern data_021a4824
        .extern func_02084fc8
        .extern func_02084fe0
        .extern func_020944ec
        .extern func_02094550
        .global func_02084e0c
        .arm
func_02084e0c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r6, r0
    ldr ip, [r3]
    mov r5, r1
    mov r4, r2
    cmp ip, #0x0
    beq .L_3d8
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_3ac
    ldr r2, [ip]
    add r0, r2, #0x1
    add r1, r0, r4
    cmp r1, #0xc0
    bhi .L_3ac
    str r0, [ip]
    ldr r0, [r3]
    cmp r4, #0x0
    add r0, r0, r2, lsl #0x2
    str r6, [r0, #0x4]
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r2, [r3]
    mov r0, r5
    ldr r1, [r2], #0x4
    add r1, r2, r1, lsl #0x2
    mov r2, r4, lsl #0x2
    bl func_02094550
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [r1]
    add r0, r0, r4
    str r0, [r1]
    ldmia sp!, {r4, r5, r6, pc}
.L_3ac:
    ldr r0, [ip]
    cmp r0, #0x0
    beq .L_3c0
    bl func_02084fe0
    b .L_3ec
.L_3c0:
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_3ec
    bl func_02084fc8
    b .L_3ec
.L_3d8:
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_3ec
    bl func_02084fc8
.L_3ec:
    ldr r1, _LIT2
    mov r0, r5
    mov r2, r4, lsl #0x2
    str r6, [r1]
    bl func_020944ec
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021a4820
_LIT1: .word data_021a4824
_LIT2: .word 0x04000400
