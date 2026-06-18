; func_ov002_02291900 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b8a8
        .extern func_ov002_022575c8
        .global func_ov002_02291900
        .arm
func_ov002_02291900:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, #0x0
    ldr r4, _LIT0
    ldr r8, _LIT1
    mov r7, r0
    mov r6, r5
.L_dc:
    ldrh r1, [r7, #0x2]
    mov r0, r7
    mov r2, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_14c
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    mla r1, r0, r8, r4
    add r2, r1, r6
    ldr r0, [r2, #0x40]
    mov r1, r0, lsr #0x16
    mov r0, r0, lsr #0x17
    and r1, r1, #0x1
    and r0, r0, #0x1
    adds r0, r1, r0
    beq .L_14c
    ldr r0, [r2, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8a8
    cmp r0, #0x4
    movle r0, #0x1
    ldmleia sp!, {r4, r5, r6, r7, r8, pc}
.L_14c:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r6, r6, #0x14
    ble .L_dc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
