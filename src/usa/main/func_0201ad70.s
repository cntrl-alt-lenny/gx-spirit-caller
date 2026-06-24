; func_0201ad70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_02104e6c
        .extern data_0210666c
        .extern func_0200994c
        .extern func_02009dd0
        .extern func_02009e80
        .extern func_02009f34
        .extern func_0200a364
        .extern func_02019018
        .extern func_02019054
        .extern func_0201908c
        .extern func_0201a354
        .extern func_0201a384
        .extern func_0201a3b8
        .extern func_0201a420
        .extern func_0201a464
        .extern func_0201b71c
        .global func_0201ad70
        .arm
func_0201ad70:
    stmdb sp!, {r4, r5, r6, lr}
    bl GetSystemWork
    ldr r6, _LIT0
    mov r5, r0
    ldrh r0, [r6, #0x5c]
    mov r4, #0x0
    and r0, r0, #0x3
    rsb r0, r0, #0x2
    cmp r0, #0x0
    ble .L_44
.L_28:
    bl func_02009f34
    ldrh r0, [r6, #0x5c]
    add r4, r4, #0x1
    and r0, r0, #0x3
    rsb r0, r0, #0x2
    cmp r4, r0
    blt .L_28
.L_44:
    ldr r0, _LIT0
    mov r1, #0x0
    strh r1, [r0, #0x5c]
.L_50:
    ldr r0, [r5, #0x10]
    add r1, r1, #0x1
    bic r0, r0, #0xff0
    str r0, [r5, #0x10]
    cmp r1, #0x5f
    add r5, r5, #0x18
    blt .L_50
    bl func_0201908c
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_134
    b .L_114
    b .L_98
    b .L_a0
    b .L_134
    b .L_134
    b .L_a8
    b .L_d0
.L_98:
    bl func_02009dd0
    b .L_134
.L_a0:
    bl func_02009e80
    b .L_134
.L_a8:
    mov r0, #0x1
    bl func_02019054
    bl func_0201a420
    cmp r0, #0x0
    beq .L_134
    bl func_0201b71c
    ldr r1, [r0]
    orr r1, r1, #0x4000
    str r1, [r0]
    b .L_134
.L_d0:
    bl func_0201a464
    cmp r0, #0x0
    beq .L_ec
    bl func_0201b71c
    ldr r1, [r0]
    bic r1, r1, #0x4000
    str r1, [r0]
.L_ec:
    mov r0, #0x1
    bl func_02019054
    bl func_0201a384
    cmp r0, #0x0
    beq .L_134
    bl func_0201b71c
    ldr r1, [r0]
    orr r1, r1, #0x2000
    str r1, [r0]
    b .L_134
.L_114:
    bl func_0201a3b8
    cmp r0, #0x0
    beq .L_134
    bl func_0201a354
    bl func_0201b71c
    ldr r1, [r0]
    bic r1, r1, #0x2000
    str r1, [r0]
.L_134:
    ldr r2, _LIT1
    mov r3, #0x0
.L_13c:
    add r0, r2, r3, lsl #0x3
    add r0, r0, #0xa00
    ldrh r1, [r0, #0x82]
    add r3, r3, #0x1
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0x82]
    cmp r3, #0x10
    blt .L_13c
    bl func_0200a364
    mov r0, #0x1
    bl func_02019018
    ldr r5, _LIT1
    mov r6, #0x0
    mov r4, #0x32
.L_178:
    add r0, r6, #0x1
    bl func_0200994c
    cmp r6, #0x5
    bgt .L_190
    beq .L_1ac
    b .L_1b4
.L_190:
    cmp r6, #0x10
    bgt .L_1b4
    cmp r6, #0xd
    blt .L_1b4
    cmpne r6, #0xf
    cmpne r6, #0x10
    bne .L_1b4
.L_1ac:
    add r0, r5, #0x1000
    strb r4, [r0, #0x56d]
.L_1b4:
    add r6, r6, #0x1
    cmp r6, #0x1a
    add r5, r5, #0x1c
    blt .L_178
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0210666c
_LIT1: .word data_02104e6c
