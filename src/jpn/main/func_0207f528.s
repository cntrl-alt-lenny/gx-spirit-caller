; func_0207f528 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207f794
        .extern func_0208fc48
        .extern func_0208fca8
        .extern func_02090074
        .extern func_020900e4
        .extern func_02090248
        .extern func_0209281c
        .global func_0207f528
        .arm
func_0207f528:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    movs r5, r2
    mov r6, r1
    mov r4, r3
    ldr r0, [r7, #0x8]
    beq .L_68
    cmp r5, #0x1
    beq .L_34
    cmp r5, #0x2
    beq .L_50
    b .L_68
.L_34:
    mov r3, #0x4000000
    ldr r2, [r3]
    ldr r1, _LIT0
    and r1, r2, r1
    orr r0, r1, r0
    str r0, [r3]
    b .L_68
.L_50:
    ldr r3, _LIT1
    ldr r1, _LIT0
    ldr r2, [r3]
    and r1, r2, r1
    orr r0, r1, r0
    str r0, [r3]
.L_68:
    ldr r0, [r7, #0x14]
    ldr r1, [r7, #0x10]
    bl func_0209281c
    cmp r5, #0x0
    beq .L_90
    cmp r5, #0x1
    beq .L_ac
    cmp r5, #0x2
    beq .L_c0
    b .L_d0
.L_90:
    bl func_02090248
    ldr r0, [r7, #0x14]
    ldr r2, [r7, #0x10]
    mov r1, r6
    bl func_020900e4
    bl func_02090074
    b .L_d0
.L_ac:
    ldr r0, [r7, #0x14]
    ldr r2, [r7, #0x10]
    mov r1, r6
    bl func_0208fca8
    b .L_d0
.L_c0:
    ldr r0, [r7, #0x14]
    ldr r2, [r7, #0x10]
    mov r1, r6
    bl func_0208fc48
.L_d0:
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    bne .L_1f0
    ldrh r0, [r7, #0x2]
    cmp r0, #0x10
    bgt .L_120
    cmp r0, #0x10
    bge .L_14c
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_15c
    b .L_15c
    b .L_12c
    b .L_134
    b .L_15c
    b .L_13c
    b .L_15c
    b .L_15c
    b .L_15c
    b .L_144
.L_120:
    cmp r0, #0x20
    beq .L_154
    b .L_15c
.L_12c:
    mov r0, #0x0
    b .L_160
.L_134:
    mov r0, #0x1
    b .L_160
.L_13c:
    mov r0, #0x2
    b .L_160
.L_144:
    mov r0, #0x3
    b .L_160
.L_14c:
    mov r0, #0x4
    b .L_160
.L_154:
    mov r0, #0x5
    b .L_160
.L_15c:
    mov r0, #0x0
.L_160:
    str r0, [r4, #0xc]
    ldrh r0, [r7]
    cmp r0, #0x10
    bgt .L_1a8
    cmp r0, #0x10
    bge .L_1d4
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_1e4
    b .L_1e4
    b .L_1b4
    b .L_1bc
    b .L_1e4
    b .L_1c4
    b .L_1e4
    b .L_1e4
    b .L_1e4
    b .L_1cc
.L_1a8:
    cmp r0, #0x20
    beq .L_1dc
    b .L_1e4
.L_1b4:
    mov r0, #0x0
    b .L_1e8
.L_1bc:
    mov r0, #0x1
    b .L_1e8
.L_1c4:
    mov r0, #0x2
    b .L_1e8
.L_1cc:
    mov r0, #0x3
    b .L_1e8
.L_1d4:
    mov r0, #0x4
    b .L_1e8
.L_1dc:
    mov r0, #0x5
    b .L_1e8
.L_1e4:
    mov r0, #0x0
.L_1e8:
    str r0, [r4, #0x10]
    b .L_200
.L_1f0:
    ldrh r0, [r7, #0x2]
    str r0, [r4, #0xc]
    ldrh r0, [r7]
    str r0, [r4, #0x10]
.L_200:
    ldr r1, [r7, #0x4]
    mov r0, #0x0
    str r1, [r4, #0x14]
    str r0, [r4, #0x18]
    mov r0, #0x1
    str r0, [r4, #0x1c]
    ldr r3, [r7, #0x8]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    str r3, [r4, #0x20]
    bl func_0207f794
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0xffcfffef
_LIT1: .word 0x04001000
