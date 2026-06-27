; func_020110e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020110e4
        .arm
func_020110e4:
    cmp r1, #0x0
    bxle lr
    ldr r2, [r0]
    mov r2, r2, lsl r1
    str r2, [r0]
    ldr r2, [r0, #0x4]
    mov r2, r2, lsl r1
    str r2, [r0, #0x4]
    ldr r2, [r0, #0x8]
    mov r2, r2, lsl r1
    str r2, [r0, #0x8]
    ldr r2, [r0, #0xc]
    mov r2, r2, lsl r1
    str r2, [r0, #0xc]
    ldr r2, [r0, #0x10]
    mov r2, r2, lsl r1
    str r2, [r0, #0x10]
    ldr r2, [r0, #0x14]
    mov r2, r2, lsl r1
    str r2, [r0, #0x14]
    ldr r2, [r0, #0x18]
    mov r2, r2, lsl r1
    str r2, [r0, #0x18]
    ldr r2, [r0, #0x1c]
    mov r2, r2, lsl r1
    str r2, [r0, #0x1c]
    ldr r2, [r0, #0x20]
    mov r1, r2, lsl r1
    str r1, [r0, #0x20]
    bx lr
