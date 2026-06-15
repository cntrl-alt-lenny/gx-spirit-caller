; func_ov004_021d552c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_0202c0c0
        .extern func_02046ac4
        .extern func_02046ae0
        .extern func_ov004_021d3a58
        .extern func_ov004_021d62b8
        .extern func_ov004_021d8798
        .extern func_ov004_021d8cd0
        .global func_ov004_021d552c
        .arm
func_ov004_021d552c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_770
    mov r0, #0xde
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x0
    bl func_ov004_021d8798
    bl func_02046ac4
    cmp r0, #0x0
    beq .L_770
    mov r0, #0x0
    bl func_ov004_021d62b8
.L_770:
    bl func_02046ae0
    cmp r0, #0x2
    bge .L_798
    mov r0, #0x27
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
.L_798:
    ldr r0, _LIT1
    ldr r0, [r0, #0x78]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT0
    bl func_ov004_021d8cd0
    mov r0, r4
    mov r1, #0x25
    mov r2, #0x78
    bl func_ov004_021d3a58
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_022915e8
_LIT1: .word data_ov004_0220b500
