; func_0203309c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02052c38
        .extern func_02052ff4
        .extern func_02053114
        .extern func_02053158
        .global func_0203309c
        .arm
func_0203309c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_02053114
    cmp r0, #0x0
    mov r0, r5
    beq .L_28
    bl func_02052c38
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_28:
    mov r1, r4
    bl func_02053158
    mov r0, r5
    bl func_02052ff4
    mov r0, r5
    bl func_02052c38
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
