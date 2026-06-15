; func_0200f854 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0218cbc8
        .extern data_0218dbc8
        .extern func_0208d3fc
        .extern func_0208d4f0
        .global func_0200f854
        .arm
func_0200f854:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r8, r0
    mov r6, r2
    mov r5, r3
    ldr r4, _LIT0
    bl func_0208d4f0
    mov r0, r7
    bl func_0208d3fc
    ldr r2, _LIT1
    mov r1, r4
    mov r0, #0x0
    bl Fill32
    ldr r0, _LIT2
    mov r1, #0x1
    cmp r8, #0xf
    str r1, [r0, #0x914]
    addls pc, pc, r8, lsl #0x2
    b .L_b74
    b .L_b28
    b .L_b38
    b .L_b38
    b .L_b48
    b .L_b38
    b .L_b48
    b .L_b48
    b .L_b58
    b .L_b38
    b .L_b48
    b .L_b48
    b .L_b58
    b .L_b48
    b .L_b58
    b .L_b58
    b .L_b68
.L_b28:
    add r0, r4, #0x1000
    mov r1, #0x0
    str r1, [r0, #0x91c]
    b .L_b74
.L_b38:
    add r0, r4, #0x1000
    mov r1, #0x20000
    str r1, [r0, #0x91c]
    b .L_b74
.L_b48:
    add r0, r4, #0x1000
    mov r1, #0x40000
    str r1, [r0, #0x91c]
    b .L_b74
.L_b58:
    add r0, r4, #0x1000
    mov r1, #0x60000
    str r1, [r0, #0x91c]
    b .L_b74
.L_b68:
    add r0, r4, #0x1000
    mov r1, #0x80000
    str r1, [r0, #0x91c]
.L_b74:
    cmp r7, #0x30
    bgt .L_ba4
    bge .L_c10
    cmp r7, #0x10
    bgt .L_b98
    bge .L_c00
    cmp r7, #0x0
    beq .L_bd0
    b .L_c1c
.L_b98:
    cmp r7, #0x20
    beq .L_be0
    b .L_c1c
.L_ba4:
    cmp r7, #0x60
    bgt .L_bbc
    bge .L_bf0
    cmp r7, #0x40
    beq .L_be0
    b .L_c1c
.L_bbc:
    cmp r7, #0x70
    addeq r0, r4, #0x1000
    moveq r1, #0x18000
    streq r1, [r0, #0x934]
    b .L_c1c
.L_bd0:
    add r0, r4, #0x1000
    mov r1, #0x0
    str r1, [r0, #0x934]
    b .L_c1c
.L_be0:
    add r0, r4, #0x1000
    mov r1, #0x4000
    str r1, [r0, #0x934]
    b .L_c1c
.L_bf0:
    add r0, r4, #0x1000
    mov r1, #0x8000
    str r1, [r0, #0x934]
    b .L_c1c
.L_c00:
    add r0, r4, #0x1000
    mov r1, #0x10000
    str r1, [r0, #0x934]
    b .L_c1c
.L_c10:
    add r0, r4, #0x1000
    mov r1, #0x14000
    str r1, [r0, #0x934]
.L_c1c:
    ldr r1, [sp, #0x18]
    add r0, r4, #0x1000
    str r1, [r0, #0x930]
    cmp r6, #0x0
    beq .L_cc4
    ldr r2, [r0, #0x91c]
    cmp r2, #0x40000
    movcc r0, #0x0
    ldmccia sp!, {r4, r5, r6, r7, r8, pc}
    mov r1, #0x2
    str r1, [r0, #0x914]
    bne .L_c78
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
    b .L_cc4
.L_c78:
    cmp r2, #0x60000
    cmpne r2, #0x80000
    bne .L_cbc
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
    b .L_cc4
.L_cbc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_cc4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0218cbc8
_LIT1: .word 0x00003148
_LIT2: .word data_0218dbc8
