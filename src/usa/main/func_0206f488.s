; func_0206f488 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee0c
        .extern data_0219ee24
        .extern data_0219ee38
        .extern func_0206f614
        .extern func_0206f9d4
        .extern func_02070e3c
        .extern func_02070e5c
        .extern func_02070e90
        .extern func_02070f00
        .global func_0206f488
        .arm
func_0206f488:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r5, r0
    bl func_02070e5c
    bl func_02070f00
    cmp r4, #0x1
    bne .L_38
    ldr r1, _LIT0
    mov r0, #0x44
    ldr r2, [r1]
    mov r1, #0x43
    bl func_02070e90
    b .L_48
.L_38:
    mov r0, #0x44
    mov r1, #0x43
    mvn r2, #0x0
    bl func_02070e90
.L_48:
    mov r6, #0x0
.L_4c:
    mov r0, r4
    bl func_0206f9d4
    mov r1, r6
    bl func_0206f614
    movs r7, r0
    bne .L_70
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_4c
.L_70:
    bl func_02070e3c
    cmp r7, #0x2
    bne .L_b4
    ldr r0, _LIT1
    mov r1, #0x3
    ldr r3, [r0]
    ldr r2, _LIT2
    mov r3, r3, lsr #0x1
    str r3, [r5]
    ldr r3, [r0]
    add sp, sp, #0x4
    mul r1, r3, r1
    mov r1, r1, lsr #0x3
    str r1, [r2]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_b4:
    ldr r1, _LIT2
    cmp r4, #0x1
    ldr r0, [r1]
    mov r0, r0, lsr #0x1
    str r0, [r1]
    str r0, [r5]
    beq .L_dc
    cmp r4, #0x2
    beq .L_100
    b .L_10c
.L_dc:
    cmp r0, #0x3c
    bcs .L_10c
    mov r2, #0x1
    ldr r0, _LIT1
    str r2, [r5]
    ldr r0, [r0]
    mov r0, r0, lsr #0x3
    str r0, [r1]
    b .L_10c
.L_100:
    cmp r0, #0x3c
    movcc r0, #0x1
    strcc r0, [r5]
.L_10c:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_0219ee0c
_LIT1: .word data_0219ee38
_LIT2: .word data_0219ee24
