; func_ov009_021ab910 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020215d8
        .extern func_ov009_021ac4d0
        .global func_ov009_021ab910
        .arm
func_ov009_021ab910:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x24]
    mov r4, #0x0
    cmp r1, #0x0
    beq .L_2c
    cmp r1, #0x1
    beq .L_78
    cmp r1, #0x2
    beq .L_98
    b .L_e0
.L_2c:
    ldr r0, [r5, #0x30]
    add r0, r0, #0x1
    str r0, [r5, #0x30]
    cmp r0, #0x4
    bne .L_e0
    mov r1, #0x4000000
    ldr r0, [r1]
    add r2, r1, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1900
    str r0, [r1]
    ldr r1, [r2]
    mov r0, #0x1
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1800
    str r1, [r2]
    str r4, [r5, #0x30]
    str r0, [r5, #0x24]
    b .L_e0
.L_78:
    bl func_ov009_021ac4d0
    cmp r0, #0x0
    beq .L_e0
    mov r0, r4
    str r0, [r5, #0x30]
    mov r0, #0x2
    str r0, [r5, #0x24]
    b .L_e0
.L_98:
    ldr r0, [r5, #0x30]
    cmp r0, #0xe
    bne .L_c4
    mov r2, #0x4000000
    ldr r0, [r2]
    add r1, r2, #0x1000
    bic r0, r0, #0x1f00
    str r0, [r2]
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    str r0, [r1]
.L_c4:
    ldr r0, [r5, #0x2c]
    bl func_020215d8
    cmp r0, #0x0
    ldr r0, [r5, #0x30]
    moveq r4, #0x1
    add r0, r0, #0x1
    str r0, [r5, #0x30]
.L_e0:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
