; func_ov006_021c2e28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f328
        .extern func_020371b8
        .extern func_ov006_021b69d8
        .extern func_ov006_021b6ae0
        .global func_ov006_021c2e28
        .arm
func_ov006_021c2e28:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    ldr r3, [r9, #0x64]
    mov r6, #0x0
    add r1, r9, r3, lsl #0x4
    ldr r2, [r1, #0xa0]
    ldr r1, [r1, #0x9c]
    cmp r3, #0x0
    moveq r8, #0x0
    ldr r0, [r9, #0x58]
    movne r8, #0x1
    ldr r4, _LIT0
    mov r7, r6
    cmp r0, #0x6
    add r5, r2, r1
    addls pc, pc, r0, lsl #0x2
    b .L_f00
    b .L_d14
    b .L_d68
    b .L_e24
    b .L_de4
    b .L_e68
    b .L_eb4
    b .L_d14
.L_d14:
    mov r0, #0x7
    str r0, [r9, #0x7c]
    ldr r0, [r9, #0x64]
    cmp r0, #0x0
    bne .L_d54
    mov r0, r4
    mov r1, r6
    mov r2, r5
    mov r3, r6
    bl func_ov006_021b69d8
    cmp r0, #0x0
    movne r0, #0x6
    moveq r0, #0x7
    str r0, [r9, #0x80]
    mov r6, #0x1
    b .L_d5c
.L_d54:
    mov r0, #0x8
    str r0, [r9, #0x80]
.L_d5c:
    mov r0, #0x0
    str r0, [r9, #0x84]
    b .L_f00
.L_d68:
    cmp r3, #0x0
    mov r0, r4
    bne .L_dac
    mov r1, r6
    mov r2, r5
    mov r3, r6
    bl func_ov006_021b69d8
    cmp r0, #0x0
    beq .L_f00
    mov r0, #0x7
    str r0, [r9, #0x7c]
    mov r0, #0x9
    str r0, [r9, #0x80]
    mov r0, r6
    str r0, [r9, #0x84]
    mov r6, #0x1
    b .L_f00
.L_dac:
    mov r2, r5
    mov r3, r6
    mov r1, #0x1
    bl func_ov006_021b69d8
    cmp r0, #0x0
    beq .L_f00
    mov r0, #0x7
    str r0, [r9, #0x7c]
    mov r0, #0x9
    str r0, [r9, #0x80]
    mov r0, r6
    str r0, [r9, #0x84]
    mov r6, #0x1
    b .L_f00
.L_de4:
    cmp r3, #0x0
    bne .L_f00
    mov r0, r4
    mov r1, r6
    mov r2, r5
    mov r3, r6
    bl func_ov006_021b69d8
    cmp r0, #0x0
    beq .L_f00
    mov r0, #0x2
    str r0, [r9, #0x50]
    mov r6, #0x1
    str r5, [r9, #0x54]
    mov r7, r6
    str r6, [r9, #0x74]
    b .L_f00
.L_e24:
    cmp r3, #0x0
    bne .L_f00
    mov r0, r4
    mov r1, r6
    mov r2, r5
    mov r3, r6
    bl func_ov006_021b69d8
    cmp r0, #0x0
    beq .L_f00
    mov r0, #0x7
    str r0, [r9, #0x7c]
    mov r0, #0xa
    str r0, [r9, #0x80]
    mov r0, r6
    str r0, [r9, #0x84]
    mov r6, #0x1
    b .L_f00
.L_e68:
    mov r0, r4
    mov r1, r8
    mov r2, r5
    mov r3, r6
    bl func_ov006_021b69d8
    cmp r0, #0x0
    beq .L_f00
    mov r0, r8, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, #0x3
    mov r0, r5, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r6, #0x1
    str r2, [r9, #0x50]
    orr r0, r1, r0, lsr #0x10
    str r0, [r9, #0x54]
    mov r7, r6
    str r6, [r9, #0x74]
    b .L_f00
.L_eb4:
    cmp r3, #0x0
    bne .L_f00
    mov r0, r4
    mov r1, r6
    mov r2, r5
    mov r3, r6
    bl func_ov006_021b69d8
    cmp r0, #0x0
    beq .L_f00
    mov r1, #0x7
    str r1, [r9, #0x7c]
    mov r3, #0xb
    mov r0, r4
    mov r2, r5
    mov r1, r6
    str r3, [r9, #0x80]
    bl func_ov006_021b6ae0
    str r0, [r9, #0x84]
    mov r6, #0x1
.L_f00:
    cmp r7, #0x0
    mov r2, #0x0
    mov r3, #0x1
    beq .L_f20
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    b .L_f44
.L_f20:
    cmp r6, #0x0
    beq .L_f38
    mov r0, #0x46
    sub r1, r0, #0x47
    bl func_020371b8
    b .L_f44
.L_f38:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
.L_f44:
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov006_0224f328
