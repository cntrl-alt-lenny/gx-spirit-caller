; func_ov002_022bccec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov002_022d1af8
        .extern data_ov002_022d28fc
        .extern func_02021660
        .extern func_020216b0
        .extern func_02037208
        .extern func_ov002_022bdb88
        .global func_ov002_022bccec
        .arm
func_ov002_022bccec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0xc60]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_1204
    b .L_1064
    b .L_1080
    b .L_10e0
    b .L_11c4
    b .L_11e4
.L_1064:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
    mov r0, #0x1
    str r0, [r5, #0xc60]
    str r1, [r5, #0xc64]
    b .L_1204
.L_1080:
    ldr r0, [r5, #0xc64]
    cmp r0, #0x2d
    blt .L_1204
    ldr r1, _LIT1
    mov r3, #0x0
    ldr r1, [r1, #0x34]
    ldr r0, _LIT2
    str r3, [sp]
    cmp r1, #0x0
    moveq r1, #0x3d
    ldr r2, [r5, #0xc58]
    movne r1, #0x18
    bl func_ov002_022bdb88
    mov r1, #0x6
    mov r2, #0x0
    bl func_02021660
    ldr r2, [r5, #0xc58]
    mov r1, #0xd
    bl func_020216b0
    mov r0, #0x2
    str r0, [r5, #0xc60]
    mov r0, #0x0
    str r0, [r5, #0xc64]
    b .L_1204
.L_10e0:
    ldr r0, [r5, #0xc58]
    ldr r4, _LIT2
    cmp r0, #0x5
    ldr r0, [r5, #0xc64]
    bne .L_1144
    cmp r0, #0x9
    cmpne r0, #0x18
    cmpne r0, #0x27
    cmpne r0, #0x36
    cmpne r0, #0x45
    bne .L_1120
    mov r0, #0x5b
    sub r1, r0, #0x5c
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_1120:
    ldr r0, [r5, #0xc64]
    cmp r0, #0xb4
    bne .L_1160
    mov r0, #0x5c
    sub r1, r0, #0x5d
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_1160
.L_1144:
    cmp r0, #0x18
    bne .L_1160
    mov r0, #0x60
    sub r1, r0, #0x61
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_1160:
    ldr r0, _LIT1
    mov r1, #0x0
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    moveq r2, #0x3d
    movne r2, #0x18
.L_1178:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_1194
    ldr r0, [r4, #0x4]
    cmp r0, r2
    moveq r0, #0x1
    beq .L_11a8
.L_1194:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r4, r4, #0x8
    blt .L_1178
    mov r0, #0x0
.L_11a8:
    cmp r0, #0x0
    bne .L_1204
    mov r0, #0x3
    str r0, [r5, #0xc60]
    mov r0, #0x0
    str r0, [r5, #0xc64]
    b .L_1204
.L_11c4:
    ldr r0, [r5, #0xc64]
    cmp r0, #0xf
    blt .L_1204
    mov r0, #0x4
    str r0, [r5, #0xc60]
    mov r0, #0x0
    str r0, [r5, #0xc64]
    b .L_1204
.L_11e4:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0xc
    str r0, [r5, #0xcc8]
    mov r0, #0x0
    str r0, [r5, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_1204:
    ldr r1, [r5, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r5, #0xc64]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d1af8
_LIT1: .word data_021040ac
_LIT2: .word data_ov002_022d28fc
