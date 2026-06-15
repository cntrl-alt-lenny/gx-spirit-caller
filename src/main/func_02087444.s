; func_02087444 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020955a8
        .extern func_020955e8
        .extern func_02095678
        .extern func_02095cfc
        .global func_02087444
        .arm
func_02087444:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    bne .L_90
    bl func_02095cfc
    ldr r1, [r4]
    mov r2, #0x1
    mov r1, r2, lsl r1
    ands r0, r1, r0
    ldmeqia sp!, {r4, pc}
    bl func_020955a8
    mov r4, r0
    mov r0, #0x1
    bl func_02095678
    mov r0, r4
    bl func_020955e8
    ldmia sp!, {r4, pc}
.L_90:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    bne .L_ac
    ldr r0, [r4, #0x10]
    bl func_020955e8
    mov r0, #0x1
    str r0, [r4, #0xc]
.L_ac:
    bl func_02095cfc
    ldr r1, [r4]
    mov r2, #0x1
    mov r1, r2, lsl r1
    ands r0, r1, r0
    bne .L_ac
    ldmia sp!, {r4, pc}
