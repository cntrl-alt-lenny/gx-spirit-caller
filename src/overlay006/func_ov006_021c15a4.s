; func_ov006_021c15a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020215d8
        .extern func_ov006_021c1680
        .extern func_ov006_021c16c8
        .extern func_ov006_021c1770
        .global func_ov006_021c15a4
        .arm
func_ov006_021c15a4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq .L_28
    cmp r1, #0x1
    beq .L_4c
    cmp r1, #0x2
    beq .L_90
    b .L_98
.L_28:
    ldr r1, [r4, #0x8]
    cmp r1, #0x2
    bne .L_98
    bl func_ov006_021c1680
    mov r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b .L_98
.L_4c:
    ldr r1, [r4, #0x8]
    cmp r1, #0x3
    bne .L_60
    mov r1, #0x1
    bl func_ov006_021c1770
.L_60:
    ldr r0, [r4]
    bl func_020215d8
    cmp r0, #0x0
    bne .L_84
    mov r1, #0x0
    str r1, [r4]
    mov r0, #0x2
    stmib r4, {r0, r1}
    b .L_98
.L_84:
    mov r0, r4
    bl func_ov006_021c16c8
    b .L_98
.L_90:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_98:
    ldr r1, [r4, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    ldmia sp!, {r4, pc}
