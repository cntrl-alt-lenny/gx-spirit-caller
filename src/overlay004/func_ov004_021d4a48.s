; func_ov004_021d4a48 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02209fd0
        .extern func_0203268c
        .extern func_02033308
        .extern OS_SNPrintf
        .extern func_ov004_021d3e9c
        .global func_ov004_021d4a48
        .arm
func_ov004_021d4a48:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x14
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_fc
    bl func_0203268c
    bl func_02033308
    mov r3, r0
    mov r2, r1
    add r0, sp, #0x8
    mov r1, r3
    bl func_ov004_021d3e9c
    ldr r0, [sp, #0xc]
    ldr r2, _LIT0
    str r0, [sp]
    ldr r1, [sp, #0x10]
    add r0, r4, #0x50
    str r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r1, #0x200
    bl OS_SNPrintf
.L_fc:
    mov r0, #0x18
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov004_02209fd0
