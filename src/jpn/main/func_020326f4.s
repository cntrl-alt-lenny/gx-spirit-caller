; func_020326f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094500
        .global func_020326f4
        .arm
func_020326f4:
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0xea4]
    mov r1, #0xc
    mul r2, r3, r1
    ldr r0, [r0, #0xe74]
    mov r1, #0x0
    bl func_02094500
    mov r0, #0x0
    ldmia sp!, {r3, pc}
