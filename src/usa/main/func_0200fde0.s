; func_0200fde0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0218cae8
        .extern func_0200fa74
        .extern func_02010e98
        .global func_0200fde0
        .arm
func_0200fde0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov ip, #0x0
    mov r9, r1
    mov r8, r3
    mov r3, ip
    cmp r2, #0x0
    ldr r1, _LIT0
    beq .L_2c
    cmp r2, #0x1
    beq .L_34
    b .L_3c
.L_2c:
    mov ip, r0
    b .L_44
.L_34:
    mov r3, r0
    b .L_44
.L_3c:
    mov r0, ip
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_44:
    cmp r9, #0x0
    beq .L_68
    ldr r0, [r9, #0xc]
    cmp ip, #0x0
    movne r0, r0, lsr #0xc
    strne r0, [ip, #0x18]
    moveq r0, r0, lsr #0xc
    streq r0, [r3, #0x8]
    b .L_20c
.L_68:
    cmp ip, #0x0
    beq .L_110
    ldrsb r0, [ip]
    cmp r0, #0x5
    bne .L_8c
    add r2, r1, #0x10c
    add r0, r1, #0xf00
    add r4, r2, #0x1800
    b .L_100
.L_8c:
    add r0, r1, #0x1000
    ldr r6, [r0, #0x914]
    mvn r3, #0x0
    cmp r6, #0x0
    mov r4, #0x0
    bls .L_e0
    ldr r5, [ip, #0x18]
.L_a8:
    add r0, r1, r4, lsl #0x3
    add r0, r0, #0x1000
    ldr r2, [r0, #0x918]
    cmp r5, r2
    bcc .L_d4
    ldr r2, [ip, #0xc]
    ldr r0, [r0, #0x91c]
    add r2, r5, r2
    cmp r2, r0
    movls r3, r4
    bls .L_e0
.L_d4:
    add r4, r4, #0x1
    cmp r4, r6
    bcc .L_a8
.L_e0:
    cmp r3, #0x0
    bge .L_f0
    bl func_02010e98
.L_ec:
    b .L_ec
.L_f0:
    add r0, r3, r3, lsl #0x2
    add r2, r1, #0x1900
    add r0, r1, r0, lsl #0x8
    add r4, r2, r3, lsl #0x2
.L_100:
    ldr r5, [ip, #0x8]
    ldr r6, [ip, #0x18]
    ldr r7, [ip, #0xc]
    b .L_138
.L_110:
    cmp r3, #0x0
    beq .L_138
    ldr r7, [r3, #0x4]
    add r2, r1, #0x910
    cmp r7, #0x10
    ldr r5, [r3]
    ldr r6, [r3, #0x8]
    add r0, r1, #0x1400
    add r4, r2, #0x1000
    movcc r7, #0x10
.L_138:
    mov r3, r0
    mov r2, #0x0
.L_140:
    ldr r1, [r3, #0xc]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    moveq r1, #0x14
    mlaeq r9, r2, r1, r0
    beq .L_16c
    add r2, r2, #0x1
    cmp r2, #0x40
    add r3, r3, #0x14
    blt .L_140
    mov r9, #0x0
.L_16c:
    cmp r9, #0x0
    mov r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r1, r9
    mov r2, #0x14
    bl Fill32
    str r5, [r9, #0x8]
    ldr r1, [r9, #0xc]
    ldr r0, _LIT1
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    and r0, r1, r0
    orr r0, r0, r6, lsl #0xc
    str r0, [r9, #0xc]
    str r7, [r9, #0x10]
    ldr r1, [r9, #0xc]
    ldr r0, [sp, #0x20]
    bic r2, r1, #0x2
    mov r1, r8, lsl #0x1f
    orr r2, r2, r1, lsr #0x1e
    bic r1, r2, #0x4
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1d
    str r0, [r9, #0xc]
    ldr r0, [r4]
    cmp r0, #0x0
    streq r9, [r4]
    ldr r1, [r4]
    ldr r2, [r9, #0xc]
    ldr r0, [r1, #0xc]
    mov r2, r2, lsr #0xc
    cmp r2, r0, lsr #0xc
    bcs .L_204
    str r9, [r1, #0x4]
    ldr r0, [r4]
    str r0, [r9]
    str r9, [r4]
    b .L_20c
.L_204:
    mov r0, r9
    bl func_0200fa74
.L_20c:
    ldr r2, [r9, #0xc]
    ldr r0, _LIT2
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x17
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x17
    orr r0, r2, r0, lsr #0x14
    str r0, [r9, #0xc]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0218cae8
_LIT1: .word 0x00000fff
_LIT2: .word 0xfffff007
