; func_0200f838 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0218cae8
        .extern data_0218dae8
        .extern func_0208d314
        .extern func_0208d408
        .global func_0200f838
        .arm
func_0200f838:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r8, r0
    mov r6, r2
    mov r5, r3
    ldr r4, _LIT0
    bl func_0208d408
    mov r0, r7
    bl func_0208d314
    ldr r2, _LIT1
    mov r1, r4
    mov r0, #0x0
    bl Fill32
    ldr r0, _LIT2
    mov r1, #0x1
    cmp r8, #0xf
    str r1, [r0, #0x914]
    addls pc, pc, r8, lsl #0x2
    b .L_d8
    b .L_8c
    b .L_9c
    b .L_9c
    b .L_ac
    b .L_9c
    b .L_ac
    b .L_ac
    b .L_bc
    b .L_9c
    b .L_ac
    b .L_ac
    b .L_bc
    b .L_ac
    b .L_bc
    b .L_bc
    b .L_cc
.L_8c:
    add r0, r4, #0x1000
    mov r1, #0x0
    str r1, [r0, #0x91c]
    b .L_d8
.L_9c:
    add r0, r4, #0x1000
    mov r1, #0x20000
    str r1, [r0, #0x91c]
    b .L_d8
.L_ac:
    add r0, r4, #0x1000
    mov r1, #0x40000
    str r1, [r0, #0x91c]
    b .L_d8
.L_bc:
    add r0, r4, #0x1000
    mov r1, #0x60000
    str r1, [r0, #0x91c]
    b .L_d8
.L_cc:
    add r0, r4, #0x1000
    mov r1, #0x80000
    str r1, [r0, #0x91c]
.L_d8:
    cmp r7, #0x30
    bgt .L_108
    bge .L_174
    cmp r7, #0x10
    bgt .L_fc
    bge .L_164
    cmp r7, #0x0
    beq .L_134
    b .L_180
.L_fc:
    cmp r7, #0x20
    beq .L_144
    b .L_180
.L_108:
    cmp r7, #0x60
    bgt .L_120
    bge .L_154
    cmp r7, #0x40
    beq .L_144
    b .L_180
.L_120:
    cmp r7, #0x70
    addeq r0, r4, #0x1000
    moveq r1, #0x18000
    streq r1, [r0, #0x934]
    b .L_180
.L_134:
    add r0, r4, #0x1000
    mov r1, #0x0
    str r1, [r0, #0x934]
    b .L_180
.L_144:
    add r0, r4, #0x1000
    mov r1, #0x4000
    str r1, [r0, #0x934]
    b .L_180
.L_154:
    add r0, r4, #0x1000
    mov r1, #0x8000
    str r1, [r0, #0x934]
    b .L_180
.L_164:
    add r0, r4, #0x1000
    mov r1, #0x10000
    str r1, [r0, #0x934]
    b .L_180
.L_174:
    add r0, r4, #0x1000
    mov r1, #0x14000
    str r1, [r0, #0x934]
.L_180:
    ldr r1, [sp, #0x18]
    add r0, r4, #0x1000
    str r1, [r0, #0x930]
    cmp r6, #0x0
    beq .L_228
    ldr r2, [r0, #0x91c]
    cmp r2, #0x40000
    movcc r0, #0x0
    ldmccia sp!, {r4, r5, r6, r7, r8, pc}
    mov r1, #0x2
    str r1, [r0, #0x914]
    bne .L_1dc
    mov r1, r6, lsr #0x1
    add r2, r1, #0x20000
    mov r3, #0x20000
    mov r1, #0x40000
    str r5, [r0, #0x938]
    str r6, [r0, #0x93c]
    str r6, [r0, #0x918]
    str r3, [r0, #0x91c]
    str r2, [r0, #0x920]
    str r1, [r0, #0x924]
    b .L_228
.L_1dc:
    cmp r2, #0x60000
    cmpne r2, #0x80000
    bne .L_220
    mov r1, r6, lsr #0x1
    add r0, r4, #0x1000
    cmp r2, #0x80000
    mov r3, #0x60000
    moveq r3, #0x80000
    add r1, r1, #0x20000
    mov r2, #0x20000
    str r5, [r0, #0x938]
    str r6, [r0, #0x93c]
    str r6, [r0, #0x918]
    str r2, [r0, #0x91c]
    str r1, [r0, #0x920]
    str r3, [r0, #0x924]
    b .L_228
.L_220:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_228:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0218cae8
_LIT1: .word 0x00003148
_LIT2: .word data_0218dae8
