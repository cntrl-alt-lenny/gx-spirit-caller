; func_020466ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da14
        .extern func_02062424
        .global func_020466ac
        .arm
func_020466ac:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    ldr r4, _LIT0
.L_10:
    ldr r0, [r4, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_30
    bl func_02062424
    ldrb r0, [r0, #0x1]
    cmp r6, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
.L_30:
    add r5, r5, #0x1
    cmp r5, #0x20
    blt .L_10
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219da14
