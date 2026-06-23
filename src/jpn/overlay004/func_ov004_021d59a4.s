; func_ov004_021d59a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220e2a0
        .extern data_ov004_02291388
        .extern func_02031cb8
        .extern func_020346ec
        .extern func_ov004_021c9cac
        .extern func_ov004_021d637c
        .global func_ov004_021d59a4
        .arm
func_ov004_021d59a4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_280
    bl func_020346ec
.L_280:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, #0x0
    bl func_ov004_021d637c
    ldr r0, _LIT1
    ldr r0, [r0, #0xccc]
    cmp r0, #0x0
    beq .L_2c0
    mov r0, #0xa
    bl func_ov004_021c9cac
    b .L_2c8
.L_2c0:
    mov r0, #0xb
    bl func_ov004_021c9cac
.L_2c8:
    mov r0, r4
    bl func_02031cb8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_02291388
_LIT1: .word data_ov004_0220e2a0
