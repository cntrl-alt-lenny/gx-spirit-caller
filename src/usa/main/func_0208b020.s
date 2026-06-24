; func_0208b020 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208b020
        .arm
func_0208b020:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr ip, [r0]
    smull lr, ip, r2, ip
    mov lr, lr, lsr #0xc
    orr lr, lr, ip, lsl #0x14
    str lr, [r1]
    ldr ip, [r0, #0x4]
    smull lr, ip, r2, ip
    mov r2, lr, lsr #0xc
    orr r2, r2, ip, lsl #0x14
    str r2, [r1, #0x4]
    ldr r2, [r0, #0x8]
    smull ip, r2, r3, r2
    mov ip, ip, lsr #0xc
    orr ip, ip, r2, lsl #0x14
    str ip, [r1, #0x8]
    ldr r0, [r0, #0xc]
    smull r2, r0, r3, r0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    str r2, [r1, #0xc]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
