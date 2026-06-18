; func_ov002_0221af10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021d6808
        .extern func_ov002_0225764c
        .global func_ov002_0221af10
        .arm
func_ov002_0221af10:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    mov r5, #0x0
    ldr r7, _LIT0
    mov r6, r0
    mov r8, r5
    mov r9, r5
.L_cec:
    ldr r0, [r7, #0xcec]
    mov r4, r9
    eor sl, r0, r5
.L_cf8:
    mov r0, r6
    mov r1, sl
    mov r2, r4
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_d28
    mov r0, r6
    mov r1, sl
    mov r2, r4
    mov r3, r8
    str r8, [sp]
    bl func_ov002_021d6808
.L_d28:
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_cf8
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_cec
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d016c
