; func_0203a88c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219c3b4
        .extern func_02038c48
        .extern func_0207cf0c
        .extern func_02088f20
        .global func_0203a88c
        .arm
func_0203a88c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r1, [r7, #0x8]
    cmp r1, #0x0
    movne r0, #0x0
    strne r0, [r1, #0x4]
    strne r0, [r7, #0x8]
    bl OS_DisableIrq
    ldr r5, [r7, #0x14]
    mov r6, r0
    mov r2, r5, lsr #0x14
    ldr r0, _LIT0
    mov r1, r7
    and r4, r2, #0xf
    bl func_0207cf0c
    mov r0, r7
    mov r1, #0x1
    bl func_02038c48
    cmp r4, #0xc
    cmpne r4, #0xd
    cmpne r4, #0x6
    beq .L_64
    mov r0, r5
    mov r1, #0x0
    bl func_02088f20
.L_64:
    mov r0, r6
    bl OS_RestoreIrq
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_0219c3b4
