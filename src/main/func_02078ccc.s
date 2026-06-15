; func_02078ccc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02078ccc
        .arm
func_02078ccc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    cmp r2, #0x0
    addls sp, sp, #0x4
    mov r3, #0x0
    ldmlsia sp!, {r4, r5, lr}
    bxls lr
.L_6c4:
    add ip, r3, #0x1
    ldrb lr, [r1, r3]
    add r4, r3, #0x2
    add r5, r3, #0x3
    ldrb ip, [r1, ip]
    mov lr, lr, lsl #0x18
    add r3, r3, #0x4
    ldrb r4, [r1, r4]
    orr ip, lr, ip, lsl #0x10
    ldrb lr, [r1, r5]
    orr r4, ip, r4, lsl #0x8
    cmp r3, r2
    orr r4, lr, r4
    str r4, [r0], #0x4
    bcc .L_6c4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
