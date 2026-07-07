; func_ov002_022315b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern data_ov002_022d0d8c
        .extern func_ov002_021d70f0
        .extern func_ov002_0221065c
        .extern func_ov002_0226aec4
        .global func_ov002_022315b8
        .arm
func_ov002_022315b8:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    mov r2, r0
    ldr ip, [r3, #0x5a8]
    cmp ip, #0x7e
    beq .L_a4
    cmp ip, #0x7f
    beq .L_58
    cmp ip, #0x80
    bne .L_d4
    ldrh lr, [r2, #0x2]
    ldr r2, _LIT1
    ldr ip, _LIT2
    mov lr, lr, lsl #0x1f
    mov lr, lr, lsr #0x1f
    and lr, lr, #0x1
    mul r2, lr, r2
    ldr r2, [ip, r2]
    str r2, [r3, #0x5ac]
    bl func_ov002_0221065c
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_58:
    ldrh r0, [r2, #0x2]
    ldr r1, _LIT1
    ldr ip, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and lr, r0, #0x1
    mul r1, lr, r1
    ldr ip, [ip, r1]
    cmp ip, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, [r3, #0x5ac]
    cmp ip, r1
    movls r0, #0x0
    ldmlsia sp!, {r3, pc}
    ldrh r1, [r2]
    bl func_ov002_0226aec4
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_a4:
    ldr r0, _LIT3
    ldrh r1, [r0, #0xb2]
    cmp r1, #0x0
    beq .L_cc
    ldrh r3, [r2, #0x2]
    ldrh r1, [r0, #0xb0]
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d70f0
.L_cc:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_d4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022d0d8c
