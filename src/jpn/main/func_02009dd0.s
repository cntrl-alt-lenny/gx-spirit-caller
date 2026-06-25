; func_02009dd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104e6c
        .extern func_020a9828
        .extern func_020a985c
        .global func_02009dd0
        .arm
func_02009dd0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x38]
    bl func_020a985c
    ldr sl, _LIT1
    ldr r5, _LIT2
    mov r9, #0x0
    mov r6, #0x19
    mov r7, #0x14
    mov r8, #0xf
    mov r4, #0x15
.L_368:
    add r0, sl, #0x1000
    ldrb r0, [r0, #0x56c]
    cmp r0, #0x0
    beq .L_3cc
    cmp r0, #0x2
    beq .L_394
    cmp r0, #0x3
    cmpne r0, #0x4
    movne r1, r8
    moveq r1, r6
    b .L_398
.L_394:
    mov r1, r7
.L_398:
    add r0, sl, #0x1000
    ldrb r0, [r0, #0x56d]
    cmp r0, r1
    bge .L_3cc
    bl func_020a9828
    mov r1, r0, lsr #0x1f
    smull r2, r3, r5, r0
    add r3, r1, r3, asr #0x2
    smull r1, r2, r4, r3
    sub r3, r0, r1
    add r1, r3, #0x14
    add r0, sl, #0x1000
    strb r1, [r0, #0x56e]
.L_3cc:
    add r9, r9, #0x1
    cmp r9, #0x1a
    add sl, sl, #0x1c
    blt .L_368
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_02104e6c
_LIT2: .word 0x30c30c31
