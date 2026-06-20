; func_ov002_022446d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021afb90
        .extern func_ov002_0223de04
        .extern func_ov002_0225368c
        .extern func_ov002_02257b48
        .global func_ov002_022446d8
        .arm
func_ov002_022446d8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    bl func_ov002_02257b48
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    ldr r2, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    mov r5, #0x0
    mov r4, #0xe
.L_38:
    mov r0, r5
    bl func_ov002_021afb90
    mov r7, r0
    mov r0, r5
    bl func_ov002_021afb90
    ldr r0, [r0]
    ldrh r1, [r6, #0x2]
    ldr r2, [r7]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x1f
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r6
    mov r2, r4
    bl func_ov002_0223de04
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_38
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    mov r0, #0x0
    bl func_ov002_021afb90
    mov r4, r0
    mov r0, #0x0
    bl func_ov002_021afb90
    ldr r1, [r4]
    ldrh r4, [r6, #0x2]
    mov r3, r1, lsl #0x12
    ldr r1, [r0]
    mov r0, r6
    mov r1, r1, lsl #0x2
    mov r2, r1, lsr #0x18
    mov r1, r4, lsl #0x1f
    mov r2, r2, lsl #0x1
    add r3, r2, r3, lsr #0x1f
    mov r1, r1, lsr #0x1f
    mov r2, #0xe
    bl func_ov002_0223de04
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x0000194f
_LIT1: .word 0x00001950
