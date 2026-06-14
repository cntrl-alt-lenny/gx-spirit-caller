; func_ov007_021b25a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov007_021b2630
        .extern func_ov007_021b2694
        .global func_ov007_021b25a0
        .arm
func_ov007_021b25a0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x34]
    cmp r1, #0x0
    beq .L_28
    cmp r1, #0x1
    beq .L_4c
    cmp r1, #0x2
    beq .L_6c
    b .L_74
.L_28:
    ldr r1, [r4, #0x38]
    cmp r1, #0x3
    bne .L_74
    bl func_ov007_021b2630
    mov r0, #0x1
    str r0, [r4, #0x34]
    mov r0, #0x0
    str r0, [r4, #0x38]
    b .L_74
.L_4c:
    bl func_ov007_021b2694
    cmp r0, #0x0
    beq .L_74
    mov r0, #0x2
    str r0, [r4, #0x34]
    mov r0, #0x0
    str r0, [r4, #0x38]
    b .L_74
.L_6c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_74:
    ldr r1, [r4, #0x38]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x38]
    ldmia sp!, {r4, pc}
