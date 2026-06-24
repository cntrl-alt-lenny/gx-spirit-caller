; func_0200fc5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218cae8
        .global func_0200fc5c
        .arm
func_0200fc5c:
    stmdb sp!, {r4, lr}
    ldrsb r1, [r0]
    ldr r2, _LIT0
    cmp r1, #0x5
    add r1, r2, #0x1000
    bne .L_1a8
    ldr r1, [r1, #0x90c]
    cmp r1, #0x0
    beq .L_1f8
    ldr r2, [r0, #0x18]
.L_188:
    ldr r0, [r1, #0xc]
    cmp r2, r0, lsr #0xc
    moveq r0, r1
    ldmeqia sp!, {r4, pc}
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_188
    b .L_1f8
.L_1a8:
    ldr lr, [r1, #0x914]
    mov r3, #0x0
    cmp lr, #0x0
    bls .L_1f8
.L_1b8:
    add r1, r2, r3, lsl #0x2
    add r1, r1, #0x1000
    ldr r4, [r1, #0x900]
    cmp r4, #0x0
    beq .L_1ec
    ldr ip, [r0, #0x18]
.L_1d0:
    ldr r1, [r4, #0xc]
    cmp ip, r1, lsr #0xc
    moveq r0, r4
    ldmeqia sp!, {r4, pc}
    ldr r4, [r4]
    cmp r4, #0x0
    bne .L_1d0
.L_1ec:
    add r3, r3, #0x1
    cmp r3, lr
    bcc .L_1b8
.L_1f8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_0218cae8
