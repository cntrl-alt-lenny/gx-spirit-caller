; func_02073d30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101eb8
        .extern data_0219eec0
        .extern func_0207ca44
        .extern func_02094688
        .global func_02073d30
        .arm
func_02073d30:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    add r1, r6, r5
    mov r4, r3
    cmp r1, r2
    beq .L_3dc
    mov r0, r2
    mov r2, r4
    bl func_02094688
.L_3dc:
    ldr r0, _LIT0
    add r1, r6, #0x6
    mov r2, #0x6
    bl func_02094688
    add r2, r5, r4
    mov r0, r6
    add r1, r6, #0x6
    sub r2, r2, #0x6
    bl func_0207ca44
    cmp r0, #0x0
    movlt r1, #0x1
    ldr r0, _LIT1
    movge r1, #0x0
    strb r1, [r0]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_02101eb8
_LIT1: .word data_0219eec0
