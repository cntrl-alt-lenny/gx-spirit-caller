; func_ov002_02242ea8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d59cc
        .extern func_ov002_022575c8
        .global func_ov002_02242ea8
        .arm
func_ov002_02242ea8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, #0x0
    ldr r9, _LIT0
    mov r7, r0
    mov r8, #0x2
    mov r4, r5
.L_18:
    mov r6, r4
.L_1c:
    mov r0, r7
    mov r1, r5
    mov r2, r6
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_58
    ldrh r2, [r7, #0x4]
    mov r0, r5
    mov r1, r6
    mov r2, r2, lsl #0x11
    mov ip, r2, lsr #0x17
    mov r2, r9
    mov r3, r8
    str ip, [sp]
    bl func_ov002_021d59cc
.L_58:
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_1c
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_18
    mov r0, #0x1
    strh r0, [r7, #0x8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00001518
