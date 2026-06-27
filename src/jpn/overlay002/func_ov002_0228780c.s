; func_ov002_0228780c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce7a4
        .global func_ov002_0228780c
        .arm
func_ov002_0228780c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr lr, _LIT0
    mov ip, #0x0
    ldr r5, [lr, #0x5d4]
    cmp r5, #0x0
    bls .L_1cc
    ldr r4, _LIT1
.L_148:
    ldrb r1, [lr, #0x5dc]
    cmp r1, #0x1f
    bgt .L_178
    bge .L_190
    cmp r1, #0x8
    bgt .L_1b8
    cmp r1, #0x6
    blt .L_1b8
    cmpne r1, #0x7
    cmpne r1, #0x8
    beq .L_190
    b .L_1b8
.L_178:
    cmp r1, #0x20
    bgt .L_188
    beq .L_190
    b .L_1b8
.L_188:
    cmp r1, #0x21
    bne .L_1b8
.L_190:
    ldr r2, [r4]
    ldrh r3, [r0, #0x2]
    mov r1, r2, lsl #0xf
    mov r2, r2, lsl #0x16
    mov r1, r1, lsr #0x1f
    mov r3, r3, lsl #0x1f
    eor r1, r1, r2, lsr #0x1f
    cmp r1, r3, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_1b8:
    add ip, ip, #0x1
    cmp ip, r5
    add lr, lr, #0x1
    add r4, r4, #0x4
    bcc .L_148
.L_1cc:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022ce7a4
