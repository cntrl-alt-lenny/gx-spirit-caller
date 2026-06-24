; func_020490ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_02049118
        .global func_020490ac
        .arm
func_020490ac:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    mov r6, r0
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_20
    cmp r6, #0x0
    bne .L_28
.L_20:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_28:
    ldr r0, [r0, #0x14]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_60
.L_38:
    mov r0, r5
    bl func_02049118
    cmp r6, r0
    moveq r0, r5
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r4]
    add r5, r5, #0x1
    ldr r0, [r0, #0x14]
    cmp r5, r0
    blt .L_38
.L_60:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219dba0
