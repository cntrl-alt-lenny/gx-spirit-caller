; func_020896c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207d0d0
        .extern func_02089680
        .global func_020896c8
        .arm
func_020896c8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    add r0, r5, #0x4
    mov r1, #0xc
    bl func_0207d0d0
    mov r0, r5
    str r4, [r5]
    bl func_02089680
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
