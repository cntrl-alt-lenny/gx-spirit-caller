; func_0203499c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201cb84
        .extern func_020325e0
        .extern func_020348f8
        .global func_0203499c
        .arm
func_0203499c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_020325e0
    cmp r0, #0x1
    beq .L_188
    cmp r0, #0x2
    beq .L_198
    b .L_1a8
.L_188:
    mov r0, r5
    mov r1, r4
    bl func_0201cb84
    ldmia sp!, {r3, r4, r5, pc}
.L_198:
    mov r0, r5
    mov r1, r4
    bl func_020348f8
    ldmia sp!, {r3, r4, r5, pc}
.L_1a8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
