; func_ov021_021ab938 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b377c
        .extern func_ov021_021aba60
        .global func_ov021_021ab938
        .arm
func_ov021_021ab938:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, #0x0
    mov r8, r0
    mov r9, #0x1
    mov r5, r6
    mov r4, r6
.L_8e8:
    mov r0, r8
    mov r7, r5
    bl func_ov021_021aba60
    ldr r1, [r8, #0x5c]
    bl func_020b377c
    ldr r2, [r8, #0x58]
    add r0, r8, r6, lsl #0x2
    ldr r1, [r2, r1, lsl #0x2]
    mov r2, r4
    str r1, [r0, #0x60]
    cmp r6, #0x0
    ble .L_93c
    ldr r1, [r0, #0x60]
.L_91c:
    add r0, r8, r2, lsl #0x2
    ldr r0, [r0, #0x60]
    cmp r0, r1
    moveq r7, r9
    beq .L_93c
    add r2, r2, #0x1
    cmp r2, r6
    blt .L_91c
.L_93c:
    cmp r7, #0x0
    bne .L_8e8
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_8e8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
