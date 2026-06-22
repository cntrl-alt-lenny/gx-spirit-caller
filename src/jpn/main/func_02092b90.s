; func_02092b90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02092b90
        .arm
func_02092b90:
    mov r0, r0, lsl #0x2
    add r0, r0, #0x2700000
    add r0, r0, #0xff000
    ldr r0, [r0, #0xda0]
    bx lr
