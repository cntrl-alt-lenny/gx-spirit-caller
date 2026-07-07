; func_ov002_021e372c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b86c
        .extern func_0202e1e0
        .global func_ov002_021e372c
        .arm
func_ov002_021e372c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x2
    cmpne r0, #0x3
    cmpne r0, #0x4
    bne .L_1c8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1c8:
    ldrh r3, [r4]
    ldr r2, _LIT0
    cmp r3, r2
    bgt .L_230
    bge .L_288
    ldr r1, _LIT1
    cmp r3, r1
    bgt .L_210
    bge .L_288
    ldr r0, _LIT2
    cmp r3, r0
    bgt .L_200
    beq .L_280
    b .L_298
.L_200:
    add r0, r0, #0x114
    cmp r3, r0
    beq .L_280
    b .L_298
.L_210:
    add r0, r1, #0x7
    cmp r3, r0
    bgt .L_224
    beq .L_288
    b .L_298
.L_224:
    cmp r3, #0x1400
    beq .L_280
    b .L_298
.L_230:
    ldr r1, _LIT3
    cmp r3, r1
    bgt .L_260
    bge .L_288
    add r0, r2, #0x88
    cmp r3, r0
    bgt .L_254
    beq .L_288
    b .L_298
.L_254:
    cmp r3, #0x1980
    beq .L_288
    b .L_298
.L_260:
    add r0, r1, #0x51
    cmp r3, r0
    bgt .L_274
    beq .L_288
    b .L_298
.L_274:
    add r0, r1, #0x8b
    cmp r3, r0
    bne .L_298
.L_280:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_288:
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1f
    ldmia sp!, {r4, pc}
.L_298:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001514
_LIT1: .word 0x00001231
_LIT2: .word 0x00000fee
_LIT3: .word 0x00001a18
