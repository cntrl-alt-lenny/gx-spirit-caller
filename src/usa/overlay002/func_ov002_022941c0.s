; func_ov002_022941c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bad9c
        .extern func_ov002_021bbdcc
        .extern func_ov002_021c8390
        .extern func_ov002_02280ce4
        .global func_ov002_022941c0
        .arm
func_ov002_022941c0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbdcc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mvn r2, #0x0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_02280ce4
    movs r1, r0
    bmi .L_1d8
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c8390
    ldr r1, _LIT1
    cmp r0, r1
    movge r0, #0x1
    ldmgeia sp!, {r4, pc}
.L_1d8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000013c3
_LIT1: .word 0x00000708
