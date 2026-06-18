; func_ov002_02221a38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d5a08
        .extern func_ov002_0225764c
        .global func_ov002_02221a38
        .arm
func_ov002_02221a38:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r6, #0x0
    mov r8, r0
    mov r4, #0x5
    mov r5, r6
.L_b08:
    mov r7, r5
.L_b0c:
    mov r0, r8
    mov r1, r6
    mov r2, r7
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_b4c
    str r4, [sp]
    ldrh r2, [r8, #0x2]
    mov r0, r8
    mov r1, r6
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    str r2, [sp, #0x4]
    ldrh r3, [r8]
    mov r2, r7
    bl func_ov002_021d5a08
.L_b4c:
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_b0c
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_b08
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
