; func_0201d47c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209448c
        .global func_0201d47c
        .arm
func_0201d47c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x28
    bl func_0209448c
    ldr r1, [r4, #0x1c]
    mov r0, #0x0
    bic r1, r1, #0xff
    orr r2, r1, #0x20
    bic r1, r2, #0xff00
    orr r1, r1, #0x2000
    str r1, [r4, #0x1c]
    ldmia sp!, {r4, pc}
