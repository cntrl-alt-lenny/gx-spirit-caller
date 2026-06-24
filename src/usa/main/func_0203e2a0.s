; func_0203e2a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c80c
        .extern func_0203c8b0
        .extern func_0203e95c
        .extern func_0207b510
        .extern func_0207b544
        .extern func_0207b7a0
        .extern func_0207bb38
        .global func_0203e2a0
        .arm
func_0203e2a0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r0, #0x10
    bl func_0203c8b0
    mov r4, r0
    mov r5, #0x9
    bl func_0207b510
    cmp r0, #0xc
    addls pc, pc, r0, lsl #0x2
    b .L_d8
    b .L_d8
    b .L_d8
    b .L_d8
    b .L_5c
    b .L_d8
    b .L_d8
    b .L_a8
    b .L_d8
    b .L_d8
    b .L_b0
    b .L_d8
    b .L_cc
    b .L_b8
.L_5c:
    ldrb r0, [r4, #0xd0c]
    ldrb r5, [r4, #0xd0e]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_8c
    ldrb r0, [r4, #0xd13]
    mov r1, #0x0
    mov r5, #0x7
    add r0, r4, r0, lsl #0x2
    strb r1, [r0, #0x444]
    b .L_d8
.L_8c:
    cmp r5, #0x3
    bcc .L_d8
    cmp r5, #0x5
    bhi .L_d8
    mov r0, r5
    bl func_0203e95c
    b .L_d8
.L_a8:
    bl func_0207bb38
    b .L_d8
.L_b0:
    bl func_0207b7a0
    b .L_d8
.L_b8:
    bl func_0207b544
    mov r0, #0x4
    bl func_0203c80c
    mov r5, #0x11
    b .L_d8
.L_cc:
    mov r0, #0x0
    bl func_0203c80c
    mov r5, #0x11
.L_d8:
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
