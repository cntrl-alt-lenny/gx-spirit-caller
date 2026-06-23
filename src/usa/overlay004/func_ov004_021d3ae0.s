; func_ov004_021d3ae0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02209d24
        .extern data_ov004_02291388
        .extern func_0202c06c
        .extern func_02032638
        .extern func_020334ec
        .extern func_02033504
        .extern func_ov004_021d86ac
        .global func_ov004_021d3ae0
        .arm
func_ov004_021d3ae0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02032638
    bl func_020334ec
    sub r0, r0, #0xa
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_94
    b .L_30
    b .L_44
    b .L_60
    b .L_7c
.L_30:
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x12
    bl func_ov004_021d86ac
    b .L_94
.L_44:
    ldr r0, _LIT2
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x12
    bl func_ov004_021d86ac
    b .L_94
.L_60:
    ldr r0, _LIT2
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x12
    bl func_ov004_021d86ac
    b .L_94
.L_7c:
    ldr r0, _LIT3
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x12
    bl func_ov004_021d86ac
.L_94:
    mov r0, #0x26
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    bl func_02032638
    bl func_02033504
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_02291388
_LIT1: .word data_ov004_02209d24
_LIT2: .word 0x00000672
_LIT3: .word 0x00000673
