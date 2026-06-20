; func_ov002_0223d9dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_0223bdb8
        .extern func_ov002_0223be40
        .global func_ov002_0223d9dc
        .arm
func_ov002_0223d9dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh ip, [r4, #0x2]
    ldr r2, _LIT0
    mov r3, ip, lsl #0x11
    ldr r2, [r2, #0x5a8]
    mov ip, ip, lsl #0x1f
    mov r3, r3, lsr #0x1f
    cmp r2, #0x7e
    eor r3, r3, ip, lsr #0x1f
    beq .L_84
    cmp r2, #0x7f
    beq .L_68
    cmp r2, #0x80
    bne .L_e8
    bl func_ov002_0223bdb8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x5b
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_68:
    ldrh r2, [r4]
    mov r0, r3
    mov r1, #0x6
    mov r3, #0x0
    bl func_ov002_021af9d0
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_84:
    bl func_ov002_021afb74
    ldr r1, [r0]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    str r1, [r0, #0x69c]
    bl func_ov002_021afb74
    mov r4, r0
    bl func_ov002_021afb74
    ldr r0, [r0]
    ldr r1, [r4]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    ldr r0, _LIT0
    add r1, r1, r2, lsr #0x1f
    str r1, [r0, #0x6a0]
    mov r1, #0x0
    str r1, [r0, #0x6a4]
    str r1, [r0, #0x6b0]
    str r1, [r0, #0x6ac]
    str r1, [r0, #0x6b4]
    mov r0, #0x63
    ldmia sp!, {r4, pc}
.L_e8:
    bl func_ov002_0223be40
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
