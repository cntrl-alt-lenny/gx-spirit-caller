; func_02001e3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02001e3c
        .arm
func_02001e3c:
    ldr r0, [r0, #0x28]
    mov r1, #0x0
    cmp r0, #0x0
    ldrnesb r0, [r0]
    cmpne r0, #0x0
    movne r1, #0x1
    cmp r1, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
