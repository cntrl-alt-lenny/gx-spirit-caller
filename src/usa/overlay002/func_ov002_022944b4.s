; func_ov002_022944b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c8390
        .extern func_ov002_02280870
        .extern func_ov002_02280ce4
        .global func_ov002_022944b4
        .arm
func_ov002_022944b4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280870
    cmp r0, #0x0
    movge r0, #0x0
    ldmgeia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mvn r2, #0x0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    mov r3, #0x0
    bl func_ov002_02280ce4
    movs r1, r0
    bmi .L_70
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c8390
    ldr r1, _LIT0
    cmp r0, r1
    movge r0, #0x1
    ldmgeia sp!, {r4, pc}
.L_70:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000514
