; func_0207fcbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207e550
        .extern func_0207e9f0
        .extern func_0207f7e0
        .extern func_0207f7f0
        .extern func_0207f810
        .extern func_0207f82c
        .extern func_0207fdc0
        .global func_0207fcbc
        .arm
func_0207fcbc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r1, [r5]
    ldrh r1, [r1, #0x4]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_0207e9f0
    mov r4, r0
    ldr r7, [r5, #0x30]
    ldrh r1, [r4]
    mov r0, r7
    bl func_0207e550
    str r0, [r5, #0x2c]
    ldr r1, [r5, #0x18]
    add r0, r5, #0x38
    ldr r2, [r1, #0x4]
    mov r1, #0x1
    and r6, r2, #0xff
    bl func_0207f7e0
    cmp r6, #0x0
    beq .L_a4
    cmp r6, #0x2
    bne .L_78
    ldrsh r1, [r4, #0x4]
    ldrsh r2, [r4, #0x6]
    add r0, r5, #0x38
    bl func_0207f82c
    b .L_a4
.L_78:
    ldr r1, [r4, #0x4]
    ldr r2, [r4, #0x8]
    add r0, r5, #0x38
    bl func_0207f7f0
    ldrh r1, [r4, #0x2]
    add r0, r5, #0x38
    bl func_0207f810
    ldrsh r1, [r4, #0xc]
    ldrsh r2, [r4, #0xe]
    add r0, r5, #0x38
    bl func_0207f82c
.L_a4:
    ldr r2, [r7, #0xc]
    cmp r2, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r1, [r5, #0x34]
    mvn r0, #0x0
    cmp r1, r0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldrh r1, [r4]
    ldr r2, [r2, #0x4]
    ldr r0, [r5, #0x34]
    add r3, r2, r1, lsl #0x3
    ldr r1, [r2, r1, lsl #0x3]
    ldr r2, [r3, #0x4]
    bl func_0207fdc0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
