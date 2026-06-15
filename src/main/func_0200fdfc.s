; func_0200fdfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0218cbc8
        .extern func_0200fa90
        .extern func_02010eb4
        .global func_0200fdfc
        .arm
func_0200fdfc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov ip, #0x0
    mov r9, r1
    mov r8, r3
    mov r3, ip
    cmp r2, #0x0
    ldr r1, _LIT0
    beq .L_68
    cmp r2, #0x1
    beq .L_70
    b .L_78
.L_68:
    mov ip, r0
    b .L_80
.L_70:
    mov r3, r0
    b .L_80
.L_78:
    mov r0, ip
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_80:
    cmp r9, #0x0
    beq .L_a4
    ldr r0, [r9, #0xc]
    cmp ip, #0x0
    movne r0, r0, lsr #0xc
    strne r0, [ip, #0x18]
    moveq r0, r0, lsr #0xc
    streq r0, [r3, #0x8]
    b .L_248
.L_a4:
    cmp ip, #0x0
    beq .L_14c
    ldrsb r0, [ip]
    cmp r0, #0x5
    bne .L_c8
    add r2, r1, #0x10c
    add r0, r1, #0xf00
    add r4, r2, #0x1800
    b .L_13c
.L_c8:
    add r0, r1, #0x1000
    ldr r6, [r0, #0x914]
    mvn r3, #0x0
    cmp r6, #0x0
    mov r4, #0x0
    bls .L_11c
    ldr r5, [ip, #0x18]
.L_e4:
    add r0, r1, r4, lsl #0x3
    add r0, r0, #0x1000
    ldr r2, [r0, #0x918]
    cmp r5, r2
    bcc .L_110
    ldr r2, [ip, #0xc]
    ldr r0, [r0, #0x91c]
    add r2, r5, r2
    cmp r2, r0
    movls r3, r4
    bls .L_11c
.L_110:
    add r4, r4, #0x1
    cmp r4, r6
    bcc .L_e4
.L_11c:
    cmp r3, #0x0
    bge .L_12c
    bl func_02010eb4
.L_128:
    b .L_128
.L_12c:
    add r0, r3, r3, lsl #0x2
    add r2, r1, #0x1900
    add r0, r1, r0, lsl #0x8
    add r4, r2, r3, lsl #0x2
.L_13c:
    ldr r5, [ip, #0x8]
    ldr r6, [ip, #0x18]
    ldr r7, [ip, #0xc]
    b .L_174
.L_14c:
    cmp r3, #0x0
    beq .L_174
    ldr r7, [r3, #0x4]
    add r2, r1, #0x910
    cmp r7, #0x10
    ldr r5, [r3]
    ldr r6, [r3, #0x8]
    add r0, r1, #0x1400
    add r4, r2, #0x1000
    movcc r7, #0x10
.L_174:
    mov r3, r0
    mov r2, #0x0
.L_17c:
    ldr r1, [r3, #0xc]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    moveq r1, #0x14
    mlaeq r9, r2, r1, r0
    beq .L_1a8
    add r2, r2, #0x1
    cmp r2, #0x40
    add r3, r3, #0x14
    blt .L_17c
    mov r9, #0x0
.L_1a8:
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
    bcs .L_240
    str r9, [r1, #0x4]
    ldr r0, [r4]
    str r0, [r9]
    str r9, [r4]
    b .L_248
.L_240:
    mov r0, r9
    bl func_0200fa90
.L_248:
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
_LIT0: .word data_0218cbc8
_LIT1: .word 0x00000fff
_LIT2: .word 0xfffff007
