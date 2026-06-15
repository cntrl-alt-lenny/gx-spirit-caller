; func_02009dec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern func_020a991c
        .extern func_020a9950
        .global func_02009dec
        .arm
func_02009dec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x38]
    bl func_020a9950
    ldr sl, _LIT1
    ldr r5, _LIT2
    mov r9, #0x0
    mov r6, #0x19
    mov r7, #0x14
    mov r8, #0xf
    mov r4, #0x15
.L_628:
    add r0, sl, #0x1000
    ldrb r0, [r0, #0x56c]
    cmp r0, #0x0
    beq .L_68c
    cmp r0, #0x2
    beq .L_654
    cmp r0, #0x3
    cmpne r0, #0x4
    movne r1, r8
    moveq r1, r6
    b .L_658
.L_654:
    mov r1, r7
.L_658:
    add r0, sl, #0x1000
    ldrb r0, [r0, #0x56d]
    cmp r0, r1
    bge .L_68c
    bl func_020a991c
    mov r1, r0, lsr #0x1f
    smull r2, r3, r5, r0
    add r3, r1, r3, asr #0x2
    smull r1, r2, r4, r3
    sub r3, r0, r1
    add r1, r3, #0x14
    add r0, sl, #0x1000
    strb r1, [r0, #0x56e]
.L_68c:
    add r9, r9, #0x1
    cmp r9, #0x1a
    add sl, sl, #0x1c
    blt .L_628
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_02104f4c
_LIT2: .word 0x30c30c31
