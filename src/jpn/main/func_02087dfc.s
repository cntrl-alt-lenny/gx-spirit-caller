; func_02087dfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a4794
        .extern func_0208786c
        .global func_02087dfc
        .arm
func_02087dfc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    mov r6, r0
    mov r5, #0x0
.L_10:
    ldrb r0, [r4, #0x2c]
    cmp r0, #0x0
    beq .L_28
    mov r0, r4
    mov r1, r6
    bl func_0208786c
.L_28:
    add r5, r5, #0x1
    cmp r5, #0x10
    add r4, r4, #0x44
    blt .L_10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021a4794
