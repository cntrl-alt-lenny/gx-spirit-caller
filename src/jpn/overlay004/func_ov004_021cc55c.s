; func_ov004_021cc55c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_021058a9
        .extern data_ov004_0220b2a0
        .extern func_0201cf4c
        .extern func_020aad04
        .extern func_ov004_021cc210
        .extern func_ov004_021cc2e0
        .extern func_ov004_021cc3bc
        .global func_ov004_021cc55c
        .arm
func_ov004_021cc55c:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    mov r0, #0x0
    str r0, [r4, #0x9c]
    str r0, [r4, #0xa0]
    sub r0, r0, #0x1
    str r0, [r4, #0xb0]
    ldr r0, [r4, #0x8c]
    cmp r0, #0x100
    ldmleia sp!, {r4, pc}
    ldr r0, _LIT1
    mov ip, #0x5
    ldrb r3, [r0, #0xa3c]
    ldr r2, [r0, #0xa64]
    ldr r1, _LIT2
    mov r0, r3, lsl #0x1d
    mov r3, r0, lsr #0x1d
    add r0, r4, #0xc1
    str ip, [r4, #0xb8]
    strb r3, [r4, #0xc0]
    str r2, [r4, #0xbc]
    bl func_020aad04
    mov r1, #0x1
    mov r2, #0x0
.L_200:
    add r0, r4, r1, lsl #0x5
    add r1, r1, #0x1
    str r2, [r0, #0xb8]
    cmp r1, #0x5
    blt .L_200
    ldr r1, [r4, #0x54]
    str r2, [r4, #0xa4]
    cmp r1, #0x2
    beq .L_230
    cmp r1, #0x3
    beq .L_264
    ldmia sp!, {r4, pc}
.L_230:
    ldr r0, [r4, #0x74]
    cmp r0, #0x0
    addne r0, r1, #0x1
    strne r0, [r4, #0x54]
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x8c]
    cmp r0, #0x200
    ldmneia sp!, {r4, pc}
    bl func_ov004_021cc210
    str r0, [r4, #0x9c]
    bl func_ov004_021cc2e0
    str r0, [r4, #0xa0]
    ldmia sp!, {r4, pc}
.L_264:
    bl func_0201cf4c
    cmp r0, #0x0
    bne .L_288
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    sub r0, r0, #0x1
    str r1, [r4, #0x74]
    str r0, [r4, #0x54]
    ldmia sp!, {r4, pc}
.L_288:
    ldr r0, [r4, #0x8c]
    cmp r0, #0x200
    ldreq r0, [r4, #0x94]
    cmpeq r0, #0x5
    ldmneia sp!, {r4, pc}
    bl func_ov004_021cc3bc
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_02104e6c
_LIT2: .word data_021058a9
