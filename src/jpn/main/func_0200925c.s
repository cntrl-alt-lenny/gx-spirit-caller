; func_0200925c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02008bf4
        .extern func_02008c68
        .extern func_02009230
        .global func_0200925c
        .arm
func_0200925c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_02008bf4
    cmp r5, #0x0
    beq .L_24
    cmp r5, #0x1
    beq .L_30
    b .L_48
.L_24:
    mov r0, r4
    bl func_02009230
    ldmia sp!, {r3, r4, r5, pc}
.L_30:
    mov r1, r4
    mov r0, #0x1
    mov r2, #0x0
    bl func_02008c68
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_48:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
