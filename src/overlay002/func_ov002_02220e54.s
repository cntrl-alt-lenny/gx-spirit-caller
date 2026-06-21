; func_ov002_02220e54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b947c
        .extern func_ov002_021ca63c
        .extern func_ov002_021d81d4
        .extern func_ov002_0223def4
        .global func_ov002_02220e54
        .arm
func_ov002_02220e54:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca63c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x10
    movs r1, r0, lsr #0x18
    beq .L_2e4
    mov r0, r4
    sub r1, r1, #0x1
    bl func_ov002_0223def4
    mov r5, r0
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0xf
    bne .L_2b0
    mov r1, r5
    and r0, r0, #0xff
    bl func_ov002_021d81d4
.L_2b0:
    ldrh r2, [r4, #0x6]
    mov r0, #0x80
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x18
    add r1, r1, #0xff
    add r1, r1, #0xff00
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0xff00
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x10
    strh r1, [r4, #0x6]
    ldmia sp!, {r3, r4, r5, pc}
.L_2e4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
