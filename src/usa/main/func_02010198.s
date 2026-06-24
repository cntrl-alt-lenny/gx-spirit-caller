; func_02010198 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218cae8
        .global func_02010198
        .arm
func_02010198:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldrsb r2, [r0]
    ldr r1, _LIT0
    cmp r2, #0x5
    add r2, r1, #0x1000
    bne .L_bc
    ldr r5, [r2, #0x90c]
    cmp r5, #0x0
    bne .L_44
    ldr r3, [r2, #0x938]
    ldr r1, [r2, #0x93c]
    ldr r2, [r0, #0xc]
    sub r0, r1, r3
    cmp r2, r0
    movhi r3, #0x80000
    mov r0, r3
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_44:
    ldr r4, [r2, #0x938]
    ldr r3, [r5, #0xc]
    ldr r2, [r0, #0xc]
    rsb r0, r4, r3, lsr #0xc
    cmp r2, r0
    movls r0, r4
    ldmlsia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r6, [r5]
    cmp r6, #0x0
    beq .L_98
.L_6c:
    ldr r4, [r5, #0xc]
    ldr r0, [r5, #0x10]
    ldr r3, [r6, #0xc]
    add r0, r0, r4, lsr #0xc
    rsb r3, r0, r3, lsr #0xc
    cmp r2, r3
    ldmlsia sp!, {r3, r4, r5, r6, r7, pc}
    mov r5, r6
    ldr r6, [r6]
    cmp r6, #0x0
    bne .L_6c
.L_98:
    add r0, r1, #0x1000
    ldr r4, [r5, #0xc]
    ldr r3, [r5, #0x10]
    ldr r1, [r0, #0x93c]
    add r0, r3, r4, lsr #0xc
    sub r1, r1, r0
    cmp r2, r1
    bhi .L_194
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_bc:
    ldr r3, [r2, #0x914]
    mov ip, #0x0
    cmp r3, #0x0
    bls .L_194
.L_cc:
    add r2, r1, ip, lsl #0x2
    add r2, r2, #0x1000
    ldr lr, [r2, #0x900]
    add r2, r1, ip, lsl #0x3
    cmp lr, #0x0
    add r2, r2, #0x1000
    bne .L_108
    ldr r5, [r2, #0x918]
    ldr r2, [r2, #0x91c]
    ldr r4, [r0, #0xc]
    sub r2, r2, r5
    cmp r4, r2
    bhi .L_188
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_108:
    ldr r5, [r2, #0x918]
    ldr r4, [lr, #0xc]
    ldr r2, [r0, #0xc]
    rsb r4, r5, r4, lsr #0xc
    cmp r2, r4
    movls r0, r5
    ldmlsia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r7, [lr]
    cmp r7, #0x0
    beq .L_160
.L_130:
    ldr r6, [lr, #0xc]
    ldr r5, [lr, #0x10]
    ldr r4, [r7, #0xc]
    add r5, r5, r6, lsr #0xc
    rsb r4, r5, r4, lsr #0xc
    cmp r2, r4
    movls r0, r5
    ldmlsia sp!, {r3, r4, r5, r6, r7, pc}
    mov lr, r7
    ldr r7, [r7]
    cmp r7, #0x0
    bne .L_130
.L_160:
    add r4, r1, ip, lsl #0x3
    add r4, r4, #0x1000
    ldr r5, [lr, #0xc]
    ldr lr, [lr, #0x10]
    ldr r4, [r4, #0x91c]
    add r5, lr, r5, lsr #0xc
    sub r4, r4, r5
    cmp r2, r4
    movls r0, r5
    ldmlsia sp!, {r3, r4, r5, r6, r7, pc}
.L_188:
    add ip, ip, #0x1
    cmp ip, r3
    bcc .L_cc
.L_194:
    mov r0, #0x80000
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_0218cae8
