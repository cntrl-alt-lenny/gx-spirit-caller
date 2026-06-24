; func_0206e98c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206c5a8
        .global func_0206e98c
        .arm
func_0206e98c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r1
    add r1, sp, #0x0
    add r2, sp, #0x4
    bl func_0206c5a8
    cmp r0, #0x0
    addlt sp, sp, #0x8
    ldmltia sp!, {r4, lr}
    bxlt lr
    ldrh r1, [sp]
    mov r2, r1, asr #0x8
    mov r1, r1, lsl #0x8
    and r2, r2, #0xff
    and r1, r1, #0xff00
    orr r1, r2, r1
    strh r1, [r4, #0x2]
    ldr ip, [sp, #0x4]
    mov r2, ip, lsr #0x18
    mov r1, ip, lsr #0x8
    mov r3, ip, lsl #0x8
    mov ip, ip, lsl #0x18
    and r2, r2, #0xff
    and r1, r1, #0xff00
    and r3, r3, #0xff0000
    orr r1, r2, r1
    and r2, ip, #-16777216
    orr r1, r3, r1
    orr r1, r2, r1
    str r1, [r4, #0x4]
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
