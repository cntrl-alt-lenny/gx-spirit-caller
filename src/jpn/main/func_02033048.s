; func_02033048 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02052bc4
        .extern func_02052f80
        .extern func_020530a0
        .extern func_020530e4
        .global func_02033048
        .arm
func_02033048:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_020530a0
    cmp r0, #0x0
    mov r0, r5
    beq .L_70
    bl func_02052bc4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_70:
    mov r1, r4
    bl func_020530e4
    mov r0, r5
    bl func_02052f80
    mov r0, r5
    bl func_02052bc4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
