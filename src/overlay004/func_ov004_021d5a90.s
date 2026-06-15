; func_ov004_021d5a90 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220e500
        .extern data_ov004_022915e8
        .extern func_02031d0c
        .extern func_0203473c
        .extern func_ov004_021c9d8c
        .extern func_ov004_021d6468
        .global func_ov004_021d5a90
        .arm
func_ov004_021d5a90:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_380
    bl func_0203473c
.L_380:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, #0x0
    bl func_ov004_021d6468
    ldr r0, _LIT1
    ldr r0, [r0, #0xccc]
    cmp r0, #0x0
    beq .L_3c0
    mov r0, #0xa
    bl func_ov004_021c9d8c
    b .L_3c8
.L_3c0:
    mov r0, #0xb
    bl func_ov004_021c9d8c
.L_3c8:
    mov r0, r4
    bl func_02031d0c
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_022915e8
_LIT1: .word data_ov004_0220e500
