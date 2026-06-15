; func_0203e2f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c85c
        .extern func_0203c900
        .extern func_0203e9ac
        .extern func_0207b5f8
        .extern func_0207b62c
        .extern func_0207b888
        .extern func_0207bc20
        .global func_0203e2f0
        .arm
func_0203e2f0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r0, #0x10
    bl func_0203c900
    mov r4, r0
    mov r5, #0x9
    bl func_0207b5f8
    cmp r0, #0xc
    addls pc, pc, r0, lsl #0x2
    b .L_51c
    b .L_51c
    b .L_51c
    b .L_51c
    b .L_4a0
    b .L_51c
    b .L_51c
    b .L_4ec
    b .L_51c
    b .L_51c
    b .L_4f4
    b .L_51c
    b .L_510
    b .L_4fc
.L_4a0:
    ldrb r0, [r4, #0xd0c]
    ldrb r5, [r4, #0xd0e]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_4d0
    ldrb r0, [r4, #0xd13]
    mov r1, #0x0
    mov r5, #0x7
    add r0, r4, r0, lsl #0x2
    strb r1, [r0, #0x444]
    b .L_51c
.L_4d0:
    cmp r5, #0x3
    bcc .L_51c
    cmp r5, #0x5
    bhi .L_51c
    mov r0, r5
    bl func_0203e9ac
    b .L_51c
.L_4ec:
    bl func_0207bc20
    b .L_51c
.L_4f4:
    bl func_0207b888
    b .L_51c
.L_4fc:
    bl func_0207b62c
    mov r0, #0x4
    bl func_0203c85c
    mov r5, #0x11
    b .L_51c
.L_510:
    mov r0, #0x0
    bl func_0203c85c
    mov r5, #0x11
.L_51c:
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
