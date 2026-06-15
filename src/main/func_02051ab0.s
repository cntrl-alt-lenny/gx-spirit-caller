; func_02051ab0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045280
        .extern func_020498f0
        .extern func_02068a20
        .extern func_02068cc8
        .global func_02051ab0
        .arm
func_02051ab0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_020498f0
    cmp r0, #0x0
    beq .L_28
    bl func_02045280
    cmp r0, #0x0
    beq .L_30
.L_28:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_30:
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    mov r1, r6
    bl func_02068cc8
    cmp r0, #0x0
    beq .L_58
    mov r1, r5
    mov r2, r4
    bl func_02068a20
    mov r4, r0
.L_58:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
