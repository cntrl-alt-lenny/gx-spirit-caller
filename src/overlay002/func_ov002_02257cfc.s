; func_ov002_02257cfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_02257464
        .extern func_ov002_0226af38
        .global func_ov002_02257cfc
        .arm
func_ov002_02257cfc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r2, [r5, #0x4]
    mov r4, r1
    mov r0, r2, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_68
    ldrh r1, [r5, #0x18]
    ldr r0, _LIT0
    cmp r1, r0
    bne .L_68
    mov r0, r2, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_54
    ldrh r0, [r5, #0x2]
    mov r1, #0x1
    mov r2, r1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af38
.L_54:
    ldrh r1, [r5, #0x4]
    mov r0, #0x0
    orr r1, r1, #0x8
    strh r1, [r5, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
.L_68:
    mov r0, r5
    bl func_ov002_02257464
    cmp r0, #0x0
    ldrne r2, [r0, #0x4]
    cmpne r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001975
