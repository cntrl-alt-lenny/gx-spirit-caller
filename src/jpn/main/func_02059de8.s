; func_02059de8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045398
        .extern func_02055268
        .extern func_02059d1c
        .global func_02059de8
        .arm
func_02059de8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, [r0]
    mov r5, r1
    ldr r0, [r0, #0x100]
    mov r4, r2
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    bl func_02059d1c
    mov r0, #0xf0
    bl func_02045398
    str r0, [r5, #0xc]
    ldr r6, [r5, #0xc]
    cmp r6, #0x0
    beq .L_c8
    mov lr, r4
    mov ip, #0xf
.L_48:
    ldmia lr!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_48
    ldr r0, [r4]
    bl func_02055268
    ldr r1, [r5, #0xc]
    str r0, [r1]
    ldr r0, [r4, #0x4]
    bl func_02055268
    ldr r1, [r5, #0xc]
    str r0, [r1, #0x4]
    ldr r0, [r4, #0x8]
    bl func_02055268
    ldr r1, [r5, #0xc]
    str r0, [r1, #0x8]
    ldr r0, [r4, #0xc]
    bl func_02055268
    ldr r1, [r5, #0xc]
    str r0, [r1, #0xc]
    ldr r0, [r4, #0x10]
    bl func_02055268
    ldr r1, [r5, #0xc]
    str r0, [r1, #0x10]
    ldr r0, [r4, #0x14]
    bl func_02055268
    ldr r1, [r5, #0xc]
    str r0, [r1, #0x14]
    ldr r0, [r4, #0xc8]
    bl func_02055268
    ldr r1, [r5, #0xc]
    str r0, [r1, #0xc8]
.L_c8:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
