; func_0206ead8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206e100
        .global func_0206ead8
        .arm
func_0206ead8:
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r0
    mov r4, r1
    mvneq r0, #0x26
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    bl func_0206e100
    cmp r5, #0x0
    ldrneh r1, [r5, #0x74]
    mov r2, r0, lsr #0x18
    mov r6, #0x8
    moveq r1, #0x0
    cmp r0, #0x0
    moveq r1, #0x0
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r5, r3, asr #0x8
    mov lr, r3, lsl #0x8
    strb r6, [r4]
    mov r6, #0x2
    mov r1, r0, lsr #0x8
    mov r3, r0, lsl #0x8
    mov ip, r0, lsl #0x18
    and r0, r1, #0xff00
    and r2, r2, #0xff
    orr r0, r2, r0
    and r1, r3, #0xff0000
    and r5, r5, #0xff
    and lr, lr, #0xff00
    strb r6, [r4, #0x1]
    orr r3, r5, lr
    and r2, ip, #-16777216
    orr r0, r1, r0
    strh r3, [r4, #0x2]
    orr r0, r2, r0
    str r0, [r4, #0x4]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
