; func_020692d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206931c
        .extern func_02069634
        .extern func_0206b5e8
        .global func_020692d0
        .arm
func_020692d0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0206b5e8
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
    bl func_02069634
    ldmia sp!, {r4, pc}
.L_390:
    mov r0, r4
    bl func_0206931c
    ldmia sp!, {r4, pc}
.L_39c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
