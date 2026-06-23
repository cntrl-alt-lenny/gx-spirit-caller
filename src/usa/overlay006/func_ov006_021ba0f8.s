; func_ov006_021ba0f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020f8b80
        .extern data_02103fcc
        .extern func_02021174
        .extern func_02021428
        .extern func_02022228
        .extern func_ov006_021bbcb4
        .extern func_ov006_021bbd70
        .extern func_ov006_021bbfc0
        .extern func_ov006_021bc350
        .extern func_ov006_021bca88
        .extern func_ov006_021bcdd0
        .extern func_ov006_021be5e8
        .extern func_ov006_021bed5c
        .extern func_ov006_021bedb8
        .extern func_ov006_021bee60
        .extern func_ov006_021bef10
        .extern func_ov006_021bf198
        .extern func_ov006_021bf348
        .extern func_ov006_021bf3f0
        .extern func_ov006_021bf4d8
        .extern func_ov006_021bf738
        .extern func_ov006_021c0b08
        .extern func_ov006_021c0cbc
        .extern func_ov006_021c10bc
        .global func_ov006_021ba0f8
        .arm
func_ov006_021ba0f8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, _LIT0
    bl func_02021174
    str r0, [r7]
    bl func_02021428
    mov r0, #0x0
    add r1, r7, #0x154
    strb r0, [r7, #0x154]
    bl func_02022228
    mov r5, #0x0
    add r6, r7, #0x174
    mov r4, r5
.L_34:
    mov r1, r6
    add r0, r5, #0x1
    strb r4, [r6], #0x20
    bl func_02022228
    add r5, r5, #0x1
    cmp r5, #0x28
    blt .L_34
    mov r0, r7
    bl func_ov006_021bbcb4
    mov r0, r7
    bl func_ov006_021bbd70
    mov r0, r7
    bl func_ov006_021bbfc0
    mov r0, r7
    bl func_ov006_021be5e8
    mov r1, #0x1
    str r1, [sp]
    mov r0, r7
    mov r2, r1
    mov r3, r1
    bl func_ov006_021bc350
    ldr r0, [r7, #0x40]
    cmp r0, #0x1
    bne .L_a4
    mov r1, #0x1
    mov r0, r7
    mov r2, r1
    bl func_ov006_021bca88
.L_a4:
    mov r1, #0x1
    mov r0, r7
    mov r2, r1
    bl func_ov006_021bcdd0
    mov r0, r7
    bl func_ov006_021bedb8
    ldr r0, [r7, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_120
    b .L_120
    b .L_e8
    b .L_f4
    b .L_120
    b .L_120
    b .L_100
    b .L_10c
.L_e8:
    mov r0, r7
    bl func_ov006_021bef10
    b .L_128
.L_f4:
    mov r0, r7
    bl func_ov006_021bf198
    b .L_128
.L_100:
    mov r0, r7
    bl func_ov006_021bf348
    b .L_128
.L_10c:
    mov r0, r7
    bl func_ov006_021bf3f0
    mov r0, r7
    bl func_ov006_021bf4d8
    b .L_128
.L_120:
    mov r0, r7
    bl func_ov006_021bee60
.L_128:
    mov r0, r7
    bl func_ov006_021bf738
    mov r0, r7
    bl func_ov006_021c0b08
    mov r0, r7
    bl func_ov006_021c0cbc
    mov r0, r7
    mov r1, #0x1
    bl func_ov006_021bed5c
    mov r0, r7
    bl func_ov006_021c10bc
    ldr r1, _LIT1
    mov r0, #0x1
    str r0, [r1, #0x1c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_020f8b80
_LIT1: .word data_02103fcc
