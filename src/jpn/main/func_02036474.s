; func_02036474 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b680
        .extern data_0219c328
        .global func_02036474
        .arm
func_02036474:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r3, _LIT0
    mov r9, r0
    mov r8, r1
    mov r7, r2
    cmp r9, r3
    mov r6, #0x0
    bls .L_54
    tst r9, #0x8000000
    bne .L_4c
    ldr r0, _LIT1
    cmp r9, r0
    bcc .L_40
    ldr r0, _LIT2
    cmp r9, r0
    bls .L_48
.L_40:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_48:
    ldr r9, [r9, #0x34]
.L_4c:
    mov r0, r9, lsl #0x10
    mov r9, r0, lsr #0x10
.L_54:
    ldr r4, _LIT1
    mov r5, #0x0
.L_5c:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_94
    ldr r0, [r4, #0x34]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, r9
    ldrneh r0, [r4, #0x74]
    cmpne r0, r9
    bne .L_94
    mov r0, r4
    mov r1, r7
    blx r8
    add r6, r6, #0x1
.L_94:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_5c
    cmp r6, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word data_0219b680
_LIT2: .word data_0219c328
