; func_ov006_021c184c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c95b4
        .extern func_0202bc5c
        .global func_ov006_021c184c
        .arm
func_ov006_021c184c:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    mov r0, r1
    bl func_0202bc5c
    mov r2, r4
    mov r1, r0
    ldrsh r0, [r2]
    cmp r0, #0x0
    blt .L_224
.L_20c:
    cmp r0, r1
    moveq r0, r4
    ldmeqia sp!, {r4, pc}
    ldrsh r0, [r4, #0x18]!
    cmp r0, #0x0
    bge .L_20c
.L_224:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_020c95b4
