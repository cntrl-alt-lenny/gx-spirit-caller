; func_ov010_021b2b80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208df94
        .extern func_0208e014
        .extern func_0208e0a0
        .extern func_0208e120
        .extern func_0208e1ac
        .extern func_0208e1cc
        .extern func_0208e200
        .extern func_0208e220
        .global func_ov010_021b2b80
        .arm
func_ov010_021b2b80:
    stmdb sp!, {r3, lr}
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_2cc
    b .L_28c
    b .L_294
    b .L_29c
    b .L_2a4
    b .L_2ac
    b .L_2b4
    b .L_2bc
    b .L_2c4
.L_28c:
    bl func_0208e220
    ldmia sp!, {r3, pc}
.L_294:
    bl func_0208e1cc
    ldmia sp!, {r3, pc}
.L_29c:
    bl func_0208e120
    ldmia sp!, {r3, pc}
.L_2a4:
    bl func_0208e014
    ldmia sp!, {r3, pc}
.L_2ac:
    bl func_0208e200
    ldmia sp!, {r3, pc}
.L_2b4:
    bl func_0208e1ac
    ldmia sp!, {r3, pc}
.L_2bc:
    bl func_0208e0a0
    ldmia sp!, {r3, pc}
.L_2c4:
    bl func_0208df94
    ldmia sp!, {r3, pc}
.L_2cc:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
