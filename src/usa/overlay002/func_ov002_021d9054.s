; func_ov002_021d9054 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02030e50
        .extern func_ov002_021b9af4
        .extern func_ov002_021b9dec
        .extern func_ov002_021d46ac
        .global func_ov002_021d9054
        .arm
func_ov002_021d9054:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, r1
    mov r5, r2
    bl func_ov002_021b9dec
    bl func_02030e50
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r5, #0x0
    beq .L_58
    cmp r6, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x3b
    mov r0, r0, lsl #0x10
    mov r1, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021d46ac
    ldmia sp!, {r4, r5, r6, pc}
.L_58:
    mov r0, r6
    mov r1, r4
    bl func_ov002_021b9af4
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r6, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x3b
    mov r0, r0, lsl #0x10
    mov r1, r4, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d46ac
    ldmia sp!, {r4, r5, r6, pc}
