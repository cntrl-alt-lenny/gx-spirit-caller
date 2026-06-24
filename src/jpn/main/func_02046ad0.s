; func_02046ad0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_02045230
        .extern func_0204681c
        .extern func_020624e8
        .global func_02046ad0
        .arm
func_02046ad0:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    cmp r0, #0x0
    beq .L_40
    bl func_02045230
    cmp r0, #0x0
    bne .L_40
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x24]
    cmp r0, #0x5
    beq .L_48
    cmp r0, #0x6
    beq .L_48
.L_40:
    mvn r0, #0x0
    ldmia sp!, {r4, pc}
.L_48:
    mov r0, r4
    bl func_0204681c
    cmp r0, #0x0
    mvneq r0, #0x1
    ldmeqia sp!, {r4, pc}
    bl func_020624e8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219da0c
