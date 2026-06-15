; func_02040cc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe7b8
        .extern data_020fe7d4
        .global func_02040cc0
        .arm
func_02040cc0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    add r0, r0, #0x1000
    mov r9, r2
    cmp r9, #0x0
    ldr r8, [r0, #0x14]
    mov sl, r1
    mov r7, #0x0
    addle sp, sp, #0x4
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r6, r7
    mov r5, r7
    mov fp, r7
    mov r4, r7
.L_66c:
    ldr r1, [sl, r7, lsl #0x3]
    cmp r1, #0x0
    beq .L_688
    ldr r0, _LIT0
    mov r2, r6
    blx r8
    str r5, [sl, r7, lsl #0x3]
.L_688:
    add r0, sl, r7, lsl #0x3
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    beq .L_6ac
    ldr r0, _LIT1
    mov r2, fp
    blx r8
    add r0, sl, r7, lsl #0x3
    str r4, [r0, #0x4]
.L_6ac:
    add r7, r7, #0x1
    cmp r7, r9
    blt .L_66c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020fe7b8
_LIT1: .word data_020fe7d4
