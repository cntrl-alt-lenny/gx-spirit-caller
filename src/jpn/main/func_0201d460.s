; func_0201d460 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208deac
        .extern func_0208df2c
        .extern func_0208dfb8
        .extern func_0208e038
        .extern func_0208e0c4
        .extern func_0208e0e4
        .extern func_0208e118
        .extern func_0208e138
        .global func_0201d460
        .arm
func_0201d460:
    stmdb sp!, {r3, lr}
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_74
    b .L_34
    b .L_3c
    b .L_44
    b .L_4c
    b .L_74
    b .L_54
    b .L_5c
    b .L_64
    b .L_6c
.L_34:
    bl func_0208e138
    ldmia sp!, {r3, pc}
.L_3c:
    bl func_0208e0e4
    ldmia sp!, {r3, pc}
.L_44:
    bl func_0208e038
    ldmia sp!, {r3, pc}
.L_4c:
    bl func_0208df2c
    ldmia sp!, {r3, pc}
.L_54:
    bl func_0208e118
    ldmia sp!, {r3, pc}
.L_5c:
    bl func_0208e0c4
    ldmia sp!, {r3, pc}
.L_64:
    bl func_0208dfb8
    ldmia sp!, {r3, pc}
.L_6c:
    bl func_0208deac
    ldmia sp!, {r3, pc}
.L_74:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
