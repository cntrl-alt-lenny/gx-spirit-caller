; func_ov011_021cc750 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f5c
        .extern func_020190f0
        .extern func_ov011_021cc5a0
        .extern func_ov011_021cc718
        .extern func_ov011_021cdab8
        .extern func_ov011_021cefe0
        .global func_ov011_021cc750
        .arm
func_ov011_021cc750:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r6, _LIT0
    bl func_ov011_021cc718
    mov r5, r0
    bl func_020190f0
    mov r4, r0
    add r5, r4, r5
    cmp r5, #0xff
    movgt r5, #0xff
    bl func_ov011_021cefe0
    cmp r0, #0x0
    bne .L_54
    ldr r1, [r6, #0x218]
    sub r0, r5, r4
    mul r2, r1, r0
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    mov r1, r5
    add r0, r4, r0, asr #0xc
    bl func_ov011_021cc5a0
    ldmia sp!, {r4, r5, r6, pc}
.L_54:
    ldr r0, [r6, #0x264]
    cmp r0, #0x0
    beq .L_6c
    cmp r0, #0x1
    beq .L_88
    b .L_94
.L_6c:
    ldr r0, [r6, #0x268]
    mov r1, r0, lsl #0x17
    mov r1, r1, lsr #0x1c
    mov r0, r0, lsl #0x13
    cmp r1, r0, lsr #0x1c
    moveq r5, r4
    b .L_94
.L_88:
    bl func_ov011_021cdab8
    cmp r0, #0x0
    moveq r5, r4
.L_94:
    mov r0, r4
    mov r1, r5
    bl func_ov011_021cc5a0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov011_021d3f5c
