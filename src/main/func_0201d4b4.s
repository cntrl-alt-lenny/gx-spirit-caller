; func_0201d4b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
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
        .global func_0201d4b4
        .arm
func_0201d4b4:
    stmdb sp!, {r3, lr}
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_100
    b .L_c0
    b .L_c8
    b .L_d0
    b .L_d8
    b .L_100
    b .L_e0
    b .L_e8
    b .L_f0
    b .L_f8
.L_c0:
    bl func_0208e220
    ldmia sp!, {r3, pc}
.L_c8:
    bl func_0208e1cc
    ldmia sp!, {r3, pc}
.L_d0:
    bl func_0208e120
    ldmia sp!, {r3, pc}
.L_d8:
    bl func_0208e014
    ldmia sp!, {r3, pc}
.L_e0:
    bl func_0208e200
    ldmia sp!, {r3, pc}
.L_e8:
    bl func_0208e1ac
    ldmia sp!, {r3, pc}
.L_f0:
    bl func_0208e0a0
    ldmia sp!, {r3, pc}
.L_f8:
    bl func_0208df94
    ldmia sp!, {r3, pc}
.L_100:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
