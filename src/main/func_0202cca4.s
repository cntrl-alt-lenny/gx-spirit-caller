; func_0202cca4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_0219ad48
        .extern func_02001d68
        .extern func_0201d4b4
        .extern func_0202cffc
        .extern func_0202d194
        .extern func_0202d1d8
        .extern func_0202d558
        .extern func_02094504
        .global func_0202cca4
        .arm
func_0202cca4:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x0
    movgt r1, #0x1
    movle r1, #0x0
    ldr r0, _LIT0
    cmp r4, #0x1
    str r1, [r0, #0x24]
    ldr r0, _LIT0
    moveq r4, #0x0
    ldr r1, [r0, #0x24]
    cmp r1, #0x0
    ldr r1, [r0, #0x4]
    bne .L_7c
    cmp r1, r4
    beq .L_68
    ldr r0, [r0, #0x68]
    bl func_0201d4b4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0xc0
    bl func_02094504
.L_68:
    ldr r1, _LIT0
    mov r0, #0x0
    str r4, [r1, #0x4]
    bl func_0202d1d8
    ldmia sp!, {r4, pc}
.L_7c:
    cmp r1, r4
    ldreq r0, [r0, #0x2c]
    cmpeq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT0
    ldr r1, [r0, #0x28]
    cmp r1, #0x0
    beq .L_c0
    cmp r1, #0x1
    beq .L_dc
    cmp r1, #0x2
    beq .L_110
.L_c0:
    ldr r0, _LIT0
    str r4, [r0, #0x4]
    bl func_0202cffc
    bl func_0202d558
    mov r0, #0x0
    bl func_0202d194
    b .L_13c
.L_dc:
    str r4, [r0, #0x4]
    bl func_0202cffc
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
    bl func_0202d558
    mov r0, #0x0
    bl func_0202d194
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x14]
    str r4, [r0, #0x4]
    b .L_13c
.L_110:
    str r4, [r0, #0x4]
    bl func_0202cffc
    bl func_0202d558
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0x4]
    bl func_0202d194
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x14]
    str r4, [r0, #0x4]
.L_13c:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x2c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219ad48
_LIT1: .word data_02104f4c
