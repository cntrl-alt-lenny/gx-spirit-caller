; func_0206925c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020692a8
        .extern func_020695c0
        .extern func_0206b574
        .global func_0206925c
        .arm
func_0206925c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0206b574
    ldr r0, [r4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_39c
    b .L_390
    b .L_39c
    b .L_384
    b .L_384
.L_384:
    mov r0, r4
    bl func_020695c0
    ldmia sp!, {r4, pc}
.L_390:
    mov r0, r4
    bl func_020692a8
    ldmia sp!, {r4, pc}
.L_39c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
