; func_02005598 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02005598
        .arm
func_02005598:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r1, [r5, #0x28]
    mov r4, #0x0
    cmp r1, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, [r5, #0x1c]
    mov r1, r2, lsl #0x10
    movs r1, r1, lsr #0x18
    sub r1, r1, #0x1
    bic r2, r2, #0xff00
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x10
    str r1, [r5, #0x1c]
    bne .L_e4
    ldr r1, [r5, #0x1c]
    mov r2, r1
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x18
    bic r2, r2, #0xff00
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x10
    str r1, [r5, #0x1c]
    ldr ip, [r5, #0x30]
    cmp ip, #0x0
    beq .L_e4
    ldr r1, [r5, #0xc]
    str r1, [sp]
    ldr r1, [r5, #0x20]
    mov r1, r1, lsl #0xa
    mov r1, r1, lsr #0x1c
    str r1, [sp, #0x4]
    ldr r2, [r5, #0x1c]
    ldr r1, [r5, #0x28]
    mov r3, r2, lsl #0x7
    ldr r2, [r5, #0x2c]
    mov r3, r3, lsr #0x17
    blx ip
    ldr r1, [r5, #0x1c]
    mov r0, #0x200
    ldr r2, [r5, #0x8]
    mov r1, r1, lsl #0x7
    ldr r3, [r5, #0x20]
    rsb r0, r0, #0x0
    sub r1, r2, r1, lsr #0x17
    and r2, r3, r0
    and r0, r1, r0, lsr #0x17
    orr r0, r2, r0
    str r0, [r5, #0x20]
    ldr r0, [r5, #0x28]
    ldrsb r0, [r0]
    cmp r0, #0x0
    moveq r0, r4
    streq r0, [r5, #0x28]
.L_e4:
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
