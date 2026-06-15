; func_0201a84c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0200a68c
        .extern func_0200a704
        .extern func_0200a8b0
        .extern func_0200a928
        .extern func_0201a824
        .global func_0201a84c
        .arm
func_0201a84c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GetSystemWork
    mov r5, r0
    cmp r6, #0x0
    mov r4, #0x0
    beq .L_2b4
    cmp r6, #0x1
    beq .L_308
    b .L_358
.L_2b4:
    bl func_0201a824
    cmp r0, #0x0
    orreq r4, r4, #0x400
    beq .L_358
    ldr r0, [r5, #0x8e8]
    mov r1, r0, lsl #0x15
    movs r1, r1, lsr #0x1f
    bne .L_2e4
    orr r0, r0, #0x400
    str r0, [r5, #0x8e8]
    orr r4, r4, #0x800
    b .L_2fc
.L_2e4:
    bl func_0200a704
    cmp r0, #0x0
    orrne r4, r4, #0x1000
    bl func_0200a928
    cmp r0, #0x0
    orrne r4, r4, #0x2000
.L_2fc:
    cmp r4, #0x0
    orreq r4, r4, #0x4000
    b .L_358
.L_308:
    bl func_0201a824
    cmp r0, #0x0
    beq .L_358
    mov r5, r4
.L_318:
    mov r0, r5
    bl func_0200a68c
    add r1, r5, #0xf
    add r5, r5, #0x1
    cmp r5, #0x3
    orr r4, r4, r0, lsl r1
    blt .L_318
    mov r5, #0x0
.L_338:
    mov r0, r5
    bl func_0200a8b0
    add r1, r5, #0x12
    add r5, r5, #0x1
    cmp r5, #0x3
    orr r4, r4, r0, lsl r1
    blt .L_338
    orr r4, r4, #0x200000
.L_358:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
