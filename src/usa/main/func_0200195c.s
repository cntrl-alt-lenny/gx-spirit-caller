; func_0200195c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b45ec
        .extern data_020c3bf0
        .extern data_02102c24
        .extern func_02006ed4
        .extern OS_SPrintf
        .global func_0200195c
        .arm
func_0200195c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    ldr fp, _LIT0
    str r0, [sp]
    mov sl, r1
    mov r9, r2
    mov r7, #0x0
    add r5, sp, #0x4
.L_20:
    ldr r0, [sp]
    mov r0, r0, asr r7
    tst r0, #0x1
    beq .L_98
    ldr r0, _LIT1
    mov r8, #0x0
    add r6, r0, r7, lsl #0x3
    ldr r0, _LIT2
    add r4, r0, r7, lsl #0x3
.L_44:
    ldr r0, [r6, r8, lsl #0x2]
    mov r1, #0x0
    cmp r7, #0x5
    movge r1, #0x1
    cmp r0, #0x0
    bne .L_8c
    ldr r1, [fp, r1, lsl #0x2]
    mov r0, r5
    ldr r2, [r4, r8, lsl #0x2]
    bl OS_SPrintf
    mov r0, r5
    mov r1, sl
    mov r2, r9
    bl func_02006ed4
    add r0, sl, r0
    add r0, r0, #0x3
    str sl, [r6, r8, lsl #0x2]
    bic sl, r0, #0x3
.L_8c:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_44
.L_98:
    add r7, r7, #0x1
    cmp r7, #0x9
    blt .L_20
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020c3bf0
_LIT1: .word data_02102c24
_LIT2: .word data_020b45ec
