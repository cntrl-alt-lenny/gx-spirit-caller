; func_0202e21c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b884
        .global func_0202e21c
        .arm
func_0202e21c:
    stmdb sp!, {r3, lr}
    bl func_0202b884
    cmp r0, #0xc
    addls pc, pc, r0, lsl #0x2
    b .L_50
    b .L_50
    b .L_48
    b .L_50
    b .L_48
    b .L_50
    b .L_48
    b .L_48
    b .L_48
    b .L_48
    b .L_50
    b .L_48
    b .L_48
    b .L_48
.L_48:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_50:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
