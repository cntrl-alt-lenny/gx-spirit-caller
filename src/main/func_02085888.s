; func_02085888 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02085888
        .arm
func_02085888:
    ldr r2, [r1, #0x18]
    mov ip, #0x0
    str r2, [r0]
    ldr r2, [r1, #0x1c]
    str r2, [r0, #0x14]
    str ip, [r0, #0x4]
    str ip, [r0, #0x30]
    ldr r2, [r1, #0x1c]
    ldrh r3, [r1, #0x2e]
    mov r1, r2, lsl #0x1
    rsb r1, r1, #0x0
    add r1, r1, #0x2000
    mul r1, r3, r1
    mov r1, r1, lsl #0x3
    str r1, [r0, #0x34]
    str ip, [r0, #0x10]
    bx lr
