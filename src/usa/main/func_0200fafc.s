; func_0200fafc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218cae8
        .global func_0200fafc
        .arm
func_0200fafc:
    stmdb sp!, {r4, lr}
    ldrsb r1, [r0]
    ldr r3, _LIT0
    cmp r1, #0x5
    add r1, r3, #0x1000
    bne .L_54
    ldr r3, [r1, #0x90c]
    cmp r3, #0x0
    beq .L_b0
.L_24:
    ldr r1, [r3, #0xc]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    ldreq r2, [r3, #0x8]
    ldreq r1, [r0, #0x8]
    cmpeq r2, r1
    moveq r0, r3
    ldmeqia sp!, {r4, pc}
    ldr r3, [r3]
    cmp r3, #0x0
    bne .L_24
    b .L_b0
.L_54:
    ldr lr, [r1, #0x914]
    mov ip, #0x0
    cmp lr, #0x0
    bls .L_b0
.L_64:
    add r1, r3, ip, lsl #0x2
    add r1, r1, #0x1000
    ldr r4, [r1, #0x900]
    cmp r4, #0x0
    beq .L_a4
.L_78:
    ldr r1, [r4, #0xc]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    ldreq r2, [r4, #0x8]
    ldreq r1, [r0, #0x8]
    cmpeq r2, r1
    moveq r0, r4
    ldmeqia sp!, {r4, pc}
    ldr r4, [r4]
    cmp r4, #0x0
    bne .L_78
.L_a4:
    add ip, ip, #0x1
    cmp ip, lr
    bcc .L_64
.L_b0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_0218cae8
