; func_ov002_02294558 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c8470
        .extern func_ov002_02280df4
        .extern func_ov002_02291160
        .global func_ov002_02294558
        .arm
func_ov002_02294558:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r3, [r5, #0x2]
    mov r4, r1
    mvn r2, #0x0
    mov r1, r3, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_02280df4
    movs r1, r0
    bmi .L_60
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c8470
    ldr r1, _LIT0
    cmp r0, r1
    bge .L_60
    mov r0, r5
    mov r1, r4
    bl func_ov002_02291160
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_60:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000514
