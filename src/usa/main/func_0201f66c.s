; func_0201f66c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6498
        .extern data_02191e60
        .extern data_02192200
        .extern func_0201f148
        .extern func_0201f6d0
        .extern func_02020b30
        .extern func_020a0504
        .global func_0201f66c
        .arm
func_0201f66c:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    bl func_020a0504
    cmp r0, #0x0
    beq .L_20
    bl func_0201f148
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_20:
    bl func_0201f6d0
    cmp r0, #0x0
    bne .L_50
    ldr r0, _LIT1
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_44
    ldr r0, _LIT2
    blx r1
.L_44:
    bl func_02020b30
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_50:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_02192200
_LIT1: .word data_02191e60
_LIT2: .word data_020c6498
