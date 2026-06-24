; func_0200620c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103c94
        .extern func_020061a0
        .global func_0200620c
        .arm
func_0200620c:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x28]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    beq .L_9c
    ldr r0, [r0, #0x20]
    bic r0, r0, #-1073741824
    bl func_020061a0
    cmp r0, #0x2
    movge r0, #0x1
    ldmgeia sp!, {r3, pc}
.L_9c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02103c94
