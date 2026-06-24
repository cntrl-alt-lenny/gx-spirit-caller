; func_02095f6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02092800
        .extern func_020951dc
        .extern func_020951f0
        .global func_02095f6c
        .arm
func_02095f6c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    bl func_020951f0
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_40
    mov r5, #0x0
    mov r4, #0x8
.L_20:
    ldr r6, [r0, #0x4]
    mov r1, r4
    str r5, [r0]
    str r5, [r0, #0x4]
    bl func_02092800
    mov r0, r6
    cmp r6, #0x0
    bne .L_20
.L_40:
    bl func_020951dc
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
