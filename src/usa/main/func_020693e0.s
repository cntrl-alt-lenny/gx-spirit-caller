; func_020693e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02069498
        .global func_020693e0
        .arm
func_020693e0:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x10
    ldr r3, [sp, #0x3c]
    mov r7, #0xfd
    mov r9, r3, lsr #0x18
    mov r8, r3, lsr #0x8
    mov sl, r3, lsl #0x8
    and r9, r9, #0xff
    and r8, r8, #0xff00
    mov r6, #0xfc
    mov r5, #0x1e
    mov r4, #0x66
    mov lr, #0x6a
    mov ip, #0xb2
    strb r7, [sp, #0x4]
    mov r3, r3, lsl #0x18
    orr r8, r9, r8
    and sl, sl, #0xff0000
    and r9, r3, #-16777216
    orr r3, sl, r8
    orr r3, r9, r3
    str r3, [sp, #0x3c]
    add r8, sp, #0x3c
    strb r6, [sp, #0x5]
    strb r5, [sp, #0x6]
    strb r4, [sp, #0x7]
    strb lr, [sp, #0x8]
    strb ip, [sp, #0x9]
    ldrb r5, [r8]
    ldrb r4, [r8, #0x1]
    add r7, sp, #0xa
    add r3, sp, #0x4
    strb r5, [r7]
    strb r4, [r7, #0x1]
    ldrb r6, [r8, #0x2]
    ldrb r5, [r8, #0x3]
    mov r4, #0xa
    strb r6, [r7, #0x2]
    strb r5, [r7, #0x3]
    str r4, [sp]
    bl func_02069498
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
