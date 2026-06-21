; func_ov002_021d1f2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern func_ov002_021c31d4
        .extern func_ov002_0229ade0
        .global func_ov002_021d1f2c
        .arm
func_ov002_021d1f2c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x810]
    cmp r0, #0x0
    beq .L_1f4
    cmp r0, #0x1
    beq .L_218
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1f4:
    mov r0, #0x0
    bl func_ov002_021c31d4
    mov r0, #0x1
    bl func_ov002_021c31d4
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_218:
    mov sl, #0x0
    mov r9, #0x14
    mov r8, #0xd
    mov r7, sl
    mov r6, r9
    mov r5, #0xe
    mov r4, sl
.L_234:
    mov r0, r9
    mov r1, sl
    mov r2, r8
    mov r3, r7
    bl func_ov002_0229ade0
    mov r0, r6
    mov r1, sl
    mov r2, r5
    mov r3, r4
    bl func_ov002_0229ade0
    add sl, sl, #0x1
    cmp sl, #0x2
    blt .L_234
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce950
