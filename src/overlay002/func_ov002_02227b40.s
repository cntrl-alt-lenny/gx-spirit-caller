; func_ov002_02227b40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d5a08
        .extern func_ov002_0225764c
        .global func_ov002_02227b40
        .arm
func_ov002_02227b40:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r7, #0x0
    mov r9, r0
    mov r5, #0x3
    mov r4, r7
    mov r6, r7
.L_aa4:
    mov r8, r6
.L_aa8:
    mov r0, r9
    mov r1, r7
    mov r2, r8
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_adc
    str r5, [sp]
    str r4, [sp, #0x4]
    ldrh r3, [r9]
    mov r0, r9
    mov r1, r7
    mov r2, r8
    bl func_ov002_021d5a08
.L_adc:
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_aa8
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_aa4
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
