; func_020349ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201cbd8
        .extern func_02032634
        .extern func_02034948
        .global func_020349ec
        .arm
func_020349ec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_02032634
    cmp r0, #0x1
    beq .L_188
    cmp r0, #0x2
    beq .L_198
    b .L_1a8
.L_188:
    mov r0, r5
    mov r1, r4
    bl func_0201cbd8
    ldmia sp!, {r3, r4, r5, pc}
.L_198:
    mov r0, r5
    mov r1, r4
    bl func_02034948
    ldmia sp!, {r3, r4, r5, pc}
.L_1a8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
