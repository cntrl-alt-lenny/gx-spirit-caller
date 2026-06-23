; func_ov004_021d4724 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02291388
        .extern func_ov004_021c9c80
        .extern func_ov004_021d3f24
        .extern func_ov004_021d86ac
        .global func_ov004_021d4724
        .arm
func_ov004_021d4724:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_40
    mov r0, #0x0
    mov r1, #0x10
    bl func_ov004_021c9c80
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x2
    bl func_ov004_021d86ac
.L_40:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov004_021d3f24
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_02291388
