; func_0201b608 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0201b5cc
        .global func_0201b608
        .arm
func_0201b608:
    stmdb sp!, {r3, lr}
    bl GetSystemWork
    mov r3, r0
    mov r2, #0x0
.L_10:
    ldr r1, [r3, #0x8]
    add r2, r2, #0x1
    bic r1, r1, #0xff
    bic r1, r1, #0x100
    str r1, [r3, #0x8]
    cmp r2, #0x56
    add r3, r3, #0x18
    blt .L_10
    ldr r1, [r0, #0x8f8]
    bic r1, r1, #0xff
    str r1, [r0, #0x8f8]
    mov r0, #0x0
    bl func_0201b5cc
    ldmia sp!, {r3, pc}
