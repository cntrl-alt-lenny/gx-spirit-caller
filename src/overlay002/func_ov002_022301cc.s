; func_ov002_022301cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d5a08
        .extern func_ov002_021e276c
        .extern func_ov002_0225764c
        .global func_ov002_022301cc
        .arm
func_ov002_022301cc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r7, #0x0
    mov r9, r0
    mov r5, #0x2
    mov r4, r7
    mov r6, r7
.L_1c:
    mov r8, r6
.L_20:
    mov r0, r9
    mov r1, r7
    mov r2, r8
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_54
    str r5, [sp]
    str r4, [sp, #0x4]
    ldrh r3, [r9]
    mov r0, r9
    mov r1, r7
    mov r2, r8
    bl func_ov002_021d5a08
.L_54:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_20
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_1c
    ldrh r0, [r9, #0x2]
    ldrh r1, [r9]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e276c
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
