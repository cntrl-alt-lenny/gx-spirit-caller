; func_0206edcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206c838
        .global func_0206edcc
        .arm
func_0206edcc:
    stmdb sp!, {r4, lr}
    ldrh r2, [r1, #0x2]
    ldr lr, [r1, #0x4]
    mov r4, r2, asr #0x8
    mov r1, r2, lsl #0x8
    mov r3, lr, lsr #0x18
    mov r2, lr, lsr #0x8
    mov ip, lr, lsl #0x8
    mov lr, lr, lsl #0x18
    and r4, r4, #0xff
    and r1, r1, #0xff00
    orr r1, r4, r1
    mov r1, r1, lsl #0x10
    and r3, r3, #0xff
    and r2, r2, #0xff00
    and ip, ip, #0xff0000
    orr r2, r3, r2
    and r3, lr, #-16777216
    orr r2, ip, r2
    mov r1, r1, lsr #0x10
    orr r2, r3, r2
    bl func_0206c838
    ldmia sp!, {r4, lr}
    bx lr
