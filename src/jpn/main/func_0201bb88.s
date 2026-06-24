; func_0201bb88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020190f0
        .extern func_0201b7a0
        .global func_0201bb88
        .arm
func_0201bb88:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r1, [r4, #0x8]
    mov r5, r0
    cmp r1, #0x0
    ldreq r0, [r5, #0x918]
    cmpeq r0, #0x0
    bne .L_6c
    bl func_020190f0
    cmp r0, #0xff
    bne .L_6c
    ldr r0, [r5, #0x900]
    mov r0, r0, lsl #0x7
    movs r0, r0, lsr #0x1f
    bne .L_6c
    mov r0, r4
    bl func_0201b7a0
    cmp r0, #0x2
    cmpne r0, #0x5
    cmpne r0, #0x7
    bne .L_6c
    ldr r1, [r4, #0x10]
    mov r0, #0x1
    orr r1, r1, #0x2000
    str r1, [r4, #0x10]
    ldmia sp!, {r3, r4, r5, pc}
.L_6c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
