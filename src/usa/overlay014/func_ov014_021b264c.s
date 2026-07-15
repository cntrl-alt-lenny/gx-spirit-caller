; func_ov014_021b264c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_021058a9
        .extern data_ov014_021b4f40
        .extern data_ov014_02234f94
        .extern func_02094410
        .extern func_020aad04
        .extern func_ov005_021acf10
        .extern func_ov014_021b2eb8
        .global func_ov014_021b264c
        .arm
func_ov014_021b264c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    bne .L_6c
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x4c
    bl func_02094410
    ldr r0, _LIT1
    ldr r1, [r0, #0x4]
    ldrb r0, [r0, #0xa3c]
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    mov r0, r0, lsl #0x1d
    cmp r1, r0, lsr #0x1d
    bne .L_5c
    ldr r1, _LIT2
    add r0, r4, #0xc
    bl func_020aad04
    b .L_6c
.L_5c:
    add r1, r4, #0xc
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094410
.L_6c:
    mov r1, #0x0
    str r1, [r4, #0x2c]
    str r1, [r4, #0x8]
    str r1, [r4]
    ldr r0, _LIT3
    str r1, [r4, #0x4]
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_a8
    mov r2, #0x1
    add r0, r4, #0xc
    mov r1, #0x3
    str r2, [r4, #0x2c]
    bl func_ov005_021acf10
    b .L_b0
.L_a8:
    mov r0, r4
    bl func_ov014_021b2eb8
.L_b0:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov014_02234f94
_LIT1: .word data_02104e6c
_LIT2: .word data_021058a9
_LIT3: .word data_ov014_021b4f40
