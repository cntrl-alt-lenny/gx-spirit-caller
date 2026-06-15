; func_02000fc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern func_02000cc4
        .extern func_02000d4c
        .extern func_02000e34
        .extern func_020124f4
        .extern func_020125ac
        .extern func_02018b34
        .extern func_02018b48
        .extern func_02018b94
        .global func_02000fc8
        .arm
func_02000fc8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    bl func_02018b48
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b .L_138
    b .L_138
    b .L_44
    b .L_b4
    b .L_bc
    b .L_cc
    b .L_dc
    b .L_ec
    b .L_fc
    b .L_108
    b .L_118
    b .L_128
.L_44:
    bl func_02018b94
    ldr r0, [r0, #0x1c]
    mov r0, r0, lsl #0xb
    mov r0, r0, asr #0x1b
    cmp r0, #0x4
    bne .L_68
    mov r0, #0x1
    bl func_020125ac
    b .L_a4
.L_68:
    bl func_02018b94
    mov r6, r0
    bl func_02018b94
    mov r5, r0
    bl func_02018b94
    ldr r2, [r6, #0x14]
    ldr r1, [r5, #0x1c]
    ldr r0, [r0, #0x1c]
    mov r3, r2, lsl #0x18
    mov r2, r0, lsl #0x10
    mov r1, r1, lsl #0xb
    mov r0, r3, lsr #0x18
    mov r1, r1, asr #0x1b
    mov r2, r2, asr #0x18
    bl func_020124f4
.L_a4:
    bl func_02000cc4
    mov r0, #0x33
    str r0, [r4, #0xb64]
    b .L_140
.L_b4:
    bl func_02000e34
    b .L_140
.L_bc:
    bl func_02000cc4
    mov r0, #0xd
    str r0, [r4, #0xb64]
    b .L_140
.L_cc:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_140
.L_dc:
    bl func_02000cc4
    mov r0, #0x29
    str r0, [r4, #0xb64]
    b .L_140
.L_ec:
    bl func_02000cc4
    mov r0, #0x3
    str r0, [r4, #0xb64]
    b .L_140
.L_fc:
    mov r0, #0x23
    str r0, [r4, #0xb64]
    b .L_140
.L_108:
    bl func_02000cc4
    mov r0, #0x21
    str r0, [r4, #0xb64]
    b .L_140
.L_118:
    bl func_02000cc4
    mov r0, #0x2b
    str r0, [r4, #0xb64]
    b .L_140
.L_128:
    bl func_02000cc4
    mov r0, #0xb
    str r0, [r4, #0xb64]
    b .L_140
.L_138:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_140:
    mov r0, #0x0
    bl func_02018b34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021040ac
