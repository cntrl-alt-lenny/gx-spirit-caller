; func_ov002_02287240 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021bae7c
        .global func_ov002_02287240
        .arm
func_ov002_02287240:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_6c
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    ldr r2, [r0, #0xcec]
    mov r1, r1, lsl #0x1f
    cmp r2, r1, lsr #0x1f
    beq .L_50
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x5
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_50:
    cmp r2, r1, lsr #0x1f
    bne .L_6c
    ldr r0, _LIT1
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x1
    movls r0, #0x1
    ldmlsia sp!, {r4, pc}
.L_6c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001539
_LIT1: .word data_ov002_022d016c
