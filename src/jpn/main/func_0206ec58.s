; func_0206ec58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206d8f8
        .global func_0206ec58
        .arm
func_0206ec58:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r5, [sp, #0x20]
    cmp r5, #0x0
    moveq r5, #0x0
    moveq r4, r5
    beq .L_6c
    ldrh r4, [r5, #0x2]
    ldr r6, [r5, #0x4]
    mov r7, r4, asr #0x8
    mov ip, r4, lsl #0x8
    mov r4, r6, lsr #0x18
    mov lr, r6, lsr #0x8
    mov r5, r6, lsl #0x8
    mov r6, r6, lsl #0x18
    and r7, r7, #0xff
    and ip, ip, #0xff00
    orr r7, r7, ip
    and r4, r4, #0xff
    and lr, lr, #0xff00
    and r5, r5, #0xff0000
    orr r4, r4, lr
    mov ip, r7, lsl #0x10
    orr r4, r5, r4
    and r6, r6, #-16777216
    mov r5, ip, lsr #0x10
    orr r4, r6, r4
.L_6c:
    str r4, [sp]
    str r3, [sp, #0x4]
    mov r3, r5
    bl func_0206d8f8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
