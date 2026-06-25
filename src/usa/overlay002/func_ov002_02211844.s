; func_ov002_02211844 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021d46ac
        .extern func_ov002_021e277c
        .global func_ov002_02211844
        .arm
func_ov002_02211844:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7e
    beq .L_174
    cmp r1, #0x7f
    beq .L_13c
    cmp r1, #0x80
    bne .L_18c
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_13c:
    ldrh r0, [r0, #0x2]
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x5a
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0x1
    bl func_ov002_021d46ac
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_174:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_18c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
