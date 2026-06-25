; func_02005994 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .global func_02005994
        .arm
func_02005994:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov fp, r0
    mov r0, r2
    ldr r8, [sp, #0x28]
    str r2, [sp]
    mov sl, r1
    mov r9, r3
    sub r7, r0, #0x1
    mov r6, #0x0
.L_24:
    add r0, r7, r6
    add r0, r0, r0, lsr #0x1f
    mov r5, r0, asr #0x1
    mla r4, r9, r5, sl
    mov r0, fp
    mov r1, r4
    blx r8
    cmp r0, #0x0
    bne .L_8c
    sub r5, r5, #0x1
    mul r6, r5, r9
    b .L_60
.L_54:
    mla r4, r9, r5, sl
    sub r6, r6, r9
    sub r5, r5, #0x1
.L_60:
    cmp r4, sl
    bls .L_7c
    mov r0, fp
    add r1, sl, r6
    blx r8
    cmp r0, #0x0
    beq .L_54
.L_7c:
    ldr r1, _LIT0
    add r0, r5, #0x1
    str r0, [r1, #0x28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8c:
    sublt r7, r5, #0x1
    addge r6, r5, #0x1
    cmp r7, r6
    bge .L_24
    ldr r1, _LIT0
    ldr r0, [sp]
    str r5, [r1, #0x28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02103fcc
