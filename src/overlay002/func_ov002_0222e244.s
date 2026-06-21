; func_ov002_0222e244 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021d5a08
        .extern func_ov002_021d6808
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0225764c
        .global func_ov002_0222e244
        .arm
func_ov002_0222e244:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    bl func_ov002_021e2b3c
    mov r9, #0x0
    ldr fp, _LIT0
    mov r6, r9
    mov r5, #0x2
    mov r4, r9
.L_24:
    ldr r0, [fp, #0xcec]
    mov r8, #0x0
    eor r7, r0, r9
.L_30:
    mov r0, sl
    mov r1, r7
    mov r2, r8
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_7c
    mov r0, sl
    mov r1, r7
    mov r2, r8
    mov r3, r6
    str r6, [sp]
    bl func_ov002_021d6808
    str r5, [sp]
    str r4, [sp, #0x4]
    ldrh r3, [sl]
    mov r0, sl
    mov r1, r7
    mov r2, r8
    bl func_ov002_021d5a08
.L_7c:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_30
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_24
    bl func_ov002_021e2c5c
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
