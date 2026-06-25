; func_0201a4fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_02105e6c
        .extern func_0201a4a8
        .global func_0201a4fc
        .arm
func_0201a4fc:
    stmdb sp!, {r3, lr}
    bl GetSystemWork
    bl func_0201a4a8
    cmp r0, #0x1
    beq .L_24
    cmp r0, #0x2
    cmpne r0, #0x3
    beq .L_3c
    b .L_54
.L_24:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x854]
    umull r1, r0, r2, r0
    mov r0, r0, lsr #0xc
    ldmia sp!, {r3, pc}
.L_3c:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x858]
    umull r1, r0, r2, r0
    mov r0, r0, lsr #0xc
    ldmia sp!, {r3, pc}
.L_54:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02105e6c
_LIT1: .word 0xd1b71759
