; func_ov007_021b24a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov007_021b2530
        .extern func_ov007_021b2594
        .global func_ov007_021b24a0
        .arm
func_ov007_021b24a0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x34]
    cmp r1, #0x0
    beq .L_30
    cmp r1, #0x1
    beq .L_54
    cmp r1, #0x2
    beq .L_74
    b .L_7c
.L_30:
    ldr r1, [r4, #0x38]
    cmp r1, #0x3
    bne .L_7c
    bl func_ov007_021b2530
    mov r0, #0x1
    str r0, [r4, #0x34]
    mov r0, #0x0
    str r0, [r4, #0x38]
    b .L_7c
.L_54:
    bl func_ov007_021b2594
    cmp r0, #0x0
    beq .L_7c
    mov r0, #0x2
    str r0, [r4, #0x34]
    mov r0, #0x0
    str r0, [r4, #0x38]
    b .L_7c
.L_74:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_7c:
    ldr r1, [r4, #0x38]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x38]
    ldmia sp!, {r4, pc}
