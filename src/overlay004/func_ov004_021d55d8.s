; func_ov004_021d55d8 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern func_02031d0c
        .extern func_ov004_021c9d8c
        .extern func_ov004_021d6468
        .global func_ov004_021d55d8
        .arm
func_ov004_021d55d8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, #0x0
    bl func_ov004_021d6468
    ldr r0, _LIT0
    ldr r0, [r0, #0x88]
    cmp r0, #0x3
    bne .L_814
    mov r0, #0x9
    bl func_ov004_021c9d8c
    b .L_81c
.L_814:
    mov r0, #0x5
    bl func_ov004_021c9d8c
.L_81c:
    mov r0, r4
    bl func_02031d0c
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b500
