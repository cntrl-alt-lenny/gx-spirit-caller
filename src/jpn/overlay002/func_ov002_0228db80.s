; func_ov002_0228db80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_0223dda4
        .global func_ov002_0228db80
        .arm
func_ov002_0228db80:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r7, r0
    ldr r0, [r2, #0x48c]
    mov r6, r1
    subs r4, r0, #0x18
    beq .L_138
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    beq .L_138
    ldrh r0, [r4, #0x6]
    mov r5, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_138
.L_f4:
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    and r0, r0, #0xff
    mov r1, r1, asr #0x8
    cmp r0, r7
    and r0, r1, #0xff
    cmpeq r0, r6
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r4, #0x6]
    add r5, r5, #0x1
    mov r0, r0, lsl #0x18
    cmp r5, r0, lsr #0x18
    blt .L_f4
.L_138:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
