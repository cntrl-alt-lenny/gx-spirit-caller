; func_0201d4dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208dcb4
        .extern func_0208dd04
        .extern func_0208dd64
        .extern func_0208ddac
        .extern func_0208de04
        .extern func_0208de24
        .extern func_0208de58
        .extern func_0208de78
        .global func_0201d4dc
        .arm
func_0201d4dc:
    stmdb sp!, {r3, lr}
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_88
    b .L_38
    b .L_40
    b .L_48
    b .L_50
    b .L_58
    b .L_60
    b .L_68
    b .L_70
    b .L_78
    b .L_80
.L_38:
    bl func_0208de78
    ldmia sp!, {r3, pc}
.L_40:
    bl func_0208de24
    ldmia sp!, {r3, pc}
.L_48:
    bl func_0208ddac
    ldmia sp!, {r3, pc}
.L_50:
    bl func_0208dd04
    ldmia sp!, {r3, pc}
.L_58:
    mov r0, #0x6400000
    ldmia sp!, {r3, pc}
.L_60:
    bl func_0208de58
    ldmia sp!, {r3, pc}
.L_68:
    bl func_0208de04
    ldmia sp!, {r3, pc}
.L_70:
    bl func_0208dd64
    ldmia sp!, {r3, pc}
.L_78:
    bl func_0208dcb4
    ldmia sp!, {r3, pc}
.L_80:
    mov r0, #0x6600000
    ldmia sp!, {r3, pc}
.L_88:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
