; func_ov002_021ca360 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02030538
        .extern func_020307b4
        .extern func_020317e4
        .extern func_ov002_021bb82c
        .extern func_ov002_021ca310
        .global func_ov002_021ca360
        .arm
func_ov002_021ca360:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    bl func_020307b4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_02030538
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    cmp r4, r0
    bgt .L_54
    bge .L_80
    sub r0, r0, #0x84
    cmp r4, r0
    beq .L_80
    b .L_bc
.L_54:
    add r0, r0, #0x3b
    sub r0, r4, r0
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_bc
    b .L_9c
    b .L_9c
    b .L_9c
    b .L_9c
    b .L_9c
    b .L_9c
.L_80:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bb82c
    cmp r0, #0x0
    beq .L_bc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_9c:
    mov r0, r4
    bl func_020317e4
    mov r1, r0
    mov r0, r5
    bl func_ov002_021bb82c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_bc:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ca310
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000160f
