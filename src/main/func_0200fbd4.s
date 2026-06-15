; func_0200fbd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218cbc8
        .global func_0200fbd4
        .arm
func_0200fbd4:
    stmdb sp!, {r4, lr}
    ldrsb r1, [r0]
    ldr r2, _LIT0
    cmp r1, #0x5
    add r1, r2, #0x1000
    bne .L_104
    ldr r1, [r1, #0x90c]
    cmp r1, #0x0
    beq .L_154
    ldr r2, [r0, #0x8]
.L_e4:
    ldr r0, [r1, #0x8]
    cmp r0, r2
    moveq r0, r1
    ldmeqia sp!, {r4, pc}
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_e4
    b .L_154
.L_104:
    ldr lr, [r1, #0x914]
    mov r3, #0x0
    cmp lr, #0x0
    bls .L_154
.L_114:
    add r1, r2, r3, lsl #0x2
    add r1, r1, #0x1000
    ldr r4, [r1, #0x900]
    cmp r4, #0x0
    beq .L_148
    ldr ip, [r0, #0x8]
.L_12c:
    ldr r1, [r4, #0x8]
    cmp r1, ip
    moveq r0, r4
    ldmeqia sp!, {r4, pc}
    ldr r4, [r4]
    cmp r4, #0x0
    bne .L_12c
.L_148:
    add r3, r3, #0x1
    cmp r3, lr
    bcc .L_114
.L_154:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_0218cbc8
