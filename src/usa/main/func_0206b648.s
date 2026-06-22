; func_0206b648 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020688f0
        .global func_0206b648
        .arm
func_0206b648:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    ldr r1, [r5, #0x5d0]
    cmp r1, #0x0
    bne .L_78
    mov r0, r4
    mov r1, #0x0
    bl func_020688f0
    b .L_80
.L_78:
    mov r0, r4
    bl func_020688f0
.L_80:
    str r4, [r5, #0x5d0]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
