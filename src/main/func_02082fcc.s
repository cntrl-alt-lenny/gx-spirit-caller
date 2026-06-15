; func_02082fcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02084efc
        .global func_02082fcc
        .arm
func_02082fcc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x34]
    cmp r0, #0x0
    ldrneb r4, [r5, #0x96]
    moveq r4, #0x0
    cmp r4, #0x1
    bne .L_76c
    ldr r1, [r5, #0x8]
    mov r0, r5
    bic r1, r1, #0x40
    str r1, [r5, #0x8]
    ldr r1, [r5, #0x34]
    blx r1
    ldr r0, [r5, #0x34]
    cmp r0, #0x0
    ldrneb r4, [r5, #0x96]
    ldr r0, [r5, #0x8]
    moveq r4, #0x0
    and r1, r0, #0x40
    b .L_770
.L_76c:
    mov r1, #0x0
.L_770:
    ldr r0, [r5, #0x8]
    ands r0, r0, #0x100
    bne .L_7c8
    cmp r1, #0x0
    bne .L_7c8
    ldr r0, [r5]
    ldrb ip, [r0, #0x1]
    ldrb r3, [r0, #0x2]
    ldrb lr, [r0, #0x3]
    ldrb r2, [r0, #0x5]
    ldrb r1, [r0, #0x6]
    orr r3, ip, r3, lsl #0x8
    ldrb r6, [r0, #0x4]
    orr ip, r3, lr, lsl #0x10
    ldrb r3, [r0, #0x7]
    orr r1, r2, r1, lsl #0x8
    orr r6, ip, r6, lsl #0x18
    ldrb r2, [r0, #0x8]
    orr r1, r1, r3, lsl #0x10
    add r0, r0, r6
    orr r1, r1, r2, lsl #0x18
    bl func_02084efc
.L_7c8:
    cmp r4, #0x3
    bne .L_7e8
    ldr r1, [r5, #0x8]
    mov r0, r5
    bic r1, r1, #0x40
    str r1, [r5, #0x8]
    ldr r1, [r5, #0x34]
    blx r1
.L_7e8:
    ldr r0, [r5]
    add r0, r0, #0x9
    str r0, [r5]
    ldmia sp!, {r4, r5, r6, pc}
