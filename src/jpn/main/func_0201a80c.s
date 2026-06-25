; func_0201a80c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0200a670
        .extern func_0200a6e8
        .extern func_0200a894
        .extern func_0200a90c
        .extern func_0201a7e4
        .global func_0201a80c
        .arm
func_0201a80c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GetSystemWork
    mov r5, r0
    cmp r6, #0x0
    mov r4, #0x0
    beq .L_28
    cmp r6, #0x1
    beq .L_7c
    b .L_cc
.L_28:
    bl func_0201a7e4
    cmp r0, #0x0
    orreq r4, r4, #0x400
    beq .L_cc
    ldr r0, [r5, #0x8e8]
    mov r1, r0, lsl #0x15
    movs r1, r1, lsr #0x1f
    bne .L_58
    orr r0, r0, #0x400
    str r0, [r5, #0x8e8]
    orr r4, r4, #0x800
    b .L_70
.L_58:
    bl func_0200a6e8
    cmp r0, #0x0
    orrne r4, r4, #0x1000
    bl func_0200a90c
    cmp r0, #0x0
    orrne r4, r4, #0x2000
.L_70:
    cmp r4, #0x0
    orreq r4, r4, #0x4000
    b .L_cc
.L_7c:
    bl func_0201a7e4
    cmp r0, #0x0
    beq .L_cc
    mov r5, r4
.L_8c:
    mov r0, r5
    bl func_0200a670
    add r1, r5, #0xf
    add r5, r5, #0x1
    cmp r5, #0x3
    orr r4, r4, r0, lsl r1
    blt .L_8c
    mov r5, #0x0
.L_ac:
    mov r0, r5
    bl func_0200a894
    add r1, r5, #0x12
    add r5, r5, #0x1
    cmp r5, #0x3
    orr r4, r4, r0, lsl r1
    blt .L_ac
    orr r4, r4, #0x200000
.L_cc:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
