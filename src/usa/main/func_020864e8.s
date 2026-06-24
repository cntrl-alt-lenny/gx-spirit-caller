; func_020864e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020864e8
        .arm
func_020864e8:
    ldr r2, [r1, #0x18]
    mov ip, #0x0
    str r2, [r0]
    ldr r2, [r1, #0x1c]
    str r2, [r0, #0x14]
    str ip, [r0, #0x4]
    ldr r3, [r1, #0x18]
    ldrh r2, [r1, #0x2c]
    rsb r3, r3, #0x1000
    mul r2, r3, r2
    mov r2, r2, lsl #0x3
    str r2, [r0, #0x30]
    ldr r2, [r1, #0x1c]
    ldrh r1, [r1, #0x2e]
    rsb r2, r2, #0x1000
    mul r1, r2, r1
    mov r1, r1, lsl #0x3
    str r1, [r0, #0x34]
    str ip, [r0, #0x10]
    bx lr
