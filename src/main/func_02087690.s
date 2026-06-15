; func_02087690 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a485c
        .extern data_021a4868
        .extern func_0207cff4
        .extern func_0207d12c
        .global func_02087690
        .arm
func_02087690:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r1, [r4]
    cmp r1, #0x0
    movne r0, #0x0
    strne r0, [r1]
    strne r0, [r4]
    ldr r5, [r4, #0x4]
    mov r1, r4
    mov r0, r5
    bl func_0207cff4
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    beq .L_10c
    add r0, r5, #0xc
    bl func_0207d12c
    ldr r0, [r4, #0x8]
    mov r1, #0x0
    str r1, [r0, #0xc]
    str r1, [r4, #0x8]
.L_10c:
    ldr r0, _LIT0
    mov r1, r4
    bl func_0207cff4
    ldr r0, _LIT1
    mov r1, r4
    bl func_0207d12c
    mov r0, #0x0
    strb r0, [r4, #0x2c]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021a4868
_LIT1: .word data_021a485c
