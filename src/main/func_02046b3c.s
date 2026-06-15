; func_02046b3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daec
        .extern func_02045280
        .extern func_02046888
        .extern func_0206255c
        .global func_02046b3c
        .arm
func_02046b3c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    cmp r0, #0x0
    beq .L_9c
    bl func_02045280
    cmp r0, #0x0
    bne .L_9c
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x24]
    cmp r0, #0x5
    beq .L_a4
    cmp r0, #0x6
    beq .L_a4
.L_9c:
    mvn r0, #0x0
    ldmia sp!, {r4, pc}
.L_a4:
    mov r0, r4
    bl func_02046888
    cmp r0, #0x0
    mvneq r0, #0x1
    ldmeqia sp!, {r4, pc}
    bl func_0206255c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219daec
