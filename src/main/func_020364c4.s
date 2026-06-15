; func_020364c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b760
        .extern data_0219c408
        .global func_020364c4
        .arm
func_020364c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r3, _LIT0
    mov r9, r0
    mov r8, r1
    mov r7, r2
    cmp r9, r3
    mov r6, #0x0
    bls .L_268
    tst r9, #0x8000000
    bne .L_260
    ldr r0, _LIT1
    cmp r9, r0
    bcc .L_254
    ldr r0, _LIT2
    cmp r9, r0
    bls .L_25c
.L_254:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_25c:
    ldr r9, [r9, #0x34]
.L_260:
    mov r0, r9, lsl #0x10
    mov r9, r0, lsr #0x10
.L_268:
    ldr r4, _LIT1
    mov r5, #0x0
.L_270:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_2a8
    ldr r0, [r4, #0x34]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, r9
    ldrneh r0, [r4, #0x74]
    cmpne r0, r9
    bne .L_2a8
    mov r0, r4
    mov r1, r7
    blx r8
    add r6, r6, #0x1
.L_2a8:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_270
    cmp r6, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word data_0219b760
_LIT2: .word data_0219c408
