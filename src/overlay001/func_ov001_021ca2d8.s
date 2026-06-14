; func_ov001_021ca2d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005c60
        .extern func_02006918
        .global func_ov001_021ca2d8
        .arm
func_ov001_021ca2d8:
    stmdb sp!, {r3, lr}
    mov r0, #0x1
    bl func_02005c60
    mov r0, #0x2
    bl func_02005c60
    bl func_02006918
    mov r0, #0x1
    ldmia sp!, {r3, pc}
