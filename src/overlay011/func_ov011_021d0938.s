; func_ov011_021d0938 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov011_021d4000
        .extern data_ov011_021d403c
        .extern func_020139fc
        .extern func_02018b34
        .extern func_02018b48
        .extern func_02018e88
        .extern func_02019160
        .extern func_ov000_021ac760
        .extern func_ov000_021ae4ac
        .extern func_ov011_021c9e98
        .extern func_ov011_021cc7a0
        .extern func_ov011_021cd6e0
        .extern func_ov011_021cefb4
        .extern func_ov011_021d0884
        .extern func_ov011_021d091c
        .extern func_ov011_021d0ffc
        .extern func_ov011_021d1028
        .global func_ov011_021d0938
        .arm
func_ov011_021d0938:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2a0]
    cmp r0, #0x0
    beq .L_24
    cmp r0, #0x1
    beq .L_38
    b .L_48
.L_24:
    mov r0, #0x0
    sub r1, r0, #0x1
    mov r2, r1
    bl func_02018e88
    b .L_48
.L_38:
    ldr r1, [r4, #0x21c]
    ldr r2, [r4, #0x220]
    mov r0, #0x0
    bl func_02018e88
.L_48:
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x1c
    bl func_02019160
    add r0, r4, #0x178
    bl func_ov000_021ac760
    cmp r0, #0x0
    beq .L_84
    ldr r0, _LIT2
    mov r1, #0x5
    str r1, [r0, #0x3c]
    bl func_ov000_021ae4ac
    ldr r1, _LIT2
    str r0, [r1, #0x40]
    b .L_1ac
.L_84:
    add r0, r4, #0x18c
    bl func_ov000_021ac760
    cmp r0, #0x0
    bne .L_a0
    bl func_02018b48
    cmp r0, #0x4
    bne .L_128
.L_a0:
    ldr r0, [r4, #0x268]
    mov r1, #0x2
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x1c
    bl func_ov011_021cd6e0
    mov r1, #0x0
    bl func_ov011_021cc7a0
    bl func_020139fc
    mov r0, #0x0
    bl func_02018b34
    ldr r0, [r4, #0x268]
    mov r2, #0x1
    bic r0, r0, #0x1e00
    orr r1, r0, #0x400
    mov r0, r1, lsl #0x13
    str r2, [r4, #0x264]
    mov r0, r0, lsr #0x1c
    bic r1, r1, #0x1e0
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x17
    str r0, [r4, #0x268]
    bl func_ov011_021cefb4
    mov r0, #0x0
    ldr r1, [r4, #0x21c]
    ldr r2, [r4, #0x220]
    bl func_02018e88
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1c
    bl func_02019160
    bl func_ov011_021d091c
    mov r0, #0x0
    bl func_ov011_021c9e98
    b .L_1ac
.L_128:
    add r0, r4, #0x1a0
    bl func_ov000_021ac760
    cmp r0, #0x0
    beq .L_154
    ldr r0, _LIT2
    mov r1, #0x2
    str r1, [r0, #0x3c]
    bl func_ov000_021ae4ac
    ldr r1, _LIT2
    str r0, [r1, #0x40]
    b .L_1ac
.L_154:
    ldr r0, [r4, #0x258]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x18
    bl func_ov011_021d0ffc
    cmp r0, #0x1
    bne .L_1ac
    ldr r0, [r4, #0x258]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x18
    bl func_ov011_021d1028
    cmp r0, #0x1
    beq .L_190
    cmp r0, #0x3
    beq .L_1a8
    b .L_1ac
.L_190:
    ldr r0, _LIT2
    mov r1, #0x15
    str r1, [r0, #0x3c]
    mov r1, #0x0
    str r1, [r0, #0x40]
    b .L_1ac
.L_1a8:
    bl func_ov011_021d091c
.L_1ac:
    bl func_ov011_021d0884
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov011_021d4000
_LIT1: .word data_ov011_021d403c
_LIT2: .word data_021040ac
