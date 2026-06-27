; func_02023188 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02197434
        .extern data_0219a834
        .extern Task_Invoke
        .global func_02023188
        .arm
func_02023188:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldrsh r3, [r0, #0x76]
    ldrsh r0, [r0, #0x74]
    cmp r3, r0
    beq .L_cc4
    add r0, r2, #0x74
    add r1, r2, #0x2b4
    mov r5, #0x0
    add r4, r0, #0x3400
    add r6, r1, #0x1000
    add r7, r2, #0x3400
    mov r9, r5
    mov r8, #0x3c
.L_c84:
    smlabb sl, r3, r8, r6
    ldr r0, [sl, #0x38]
    cmp r0, #0x0
    beq .L_c9c
    bl Task_Invoke
    str r5, [sl, #0x38]
.L_c9c:
    ldrsh r0, [r4]
    ldrsh r3, [r7, #0x76]
    add r0, r0, #0x1
    strh r0, [r4]
    ldrsh r0, [r7, #0x74]
    cmp r0, #0x90
    strgeh r9, [r7, #0x74]
    ldrsh r0, [r7, #0x74]
    cmp r3, r0
    bne .L_c84
.L_cc4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219a834
_LIT1: .word data_02197434
