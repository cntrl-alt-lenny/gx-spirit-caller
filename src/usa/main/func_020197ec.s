; func_020197ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020195d0
        .extern func_02019778
        .global func_020197ec
        .arm
func_020197ec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    mov r0, r4
    bl func_020195d0
    cmp r0, #0x5
    blt .L_178
    mov r0, r4
    bl func_02019778
    cmp r0, #0x0
    movgt r0, #0x1
    ldmgtia sp!, {r4, pc}
.L_178:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
