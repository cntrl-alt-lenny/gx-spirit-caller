; func_ov002_0229df00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern func_ov002_0229dab8
        .global func_ov002_0229df00
        .arm
func_ov002_0229df00:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r4, [r6, #0xa8]
    mov r5, r1
    add r0, sp, #0x0
    mov r1, r6
    mov r2, r4
    bl func_ov002_0229dab8
    ldr r0, _LIT0
    ldr r3, [sp]
    ldr r0, [r0, #0x4]
    ldr r2, [sp, #0x4]
    ldr r1, [r6, #0xa0]
    eor r0, r0, #0x1
    cmp r1, r0
    subne r0, r3, #0xb
    str r3, [sp, #0x8]
    str r2, [sp, #0xc]
    subne r1, r5, r0
    bne .L_4a8
    add r0, r3, #0xb
    sub r0, r5, r0
    rsb r1, r0, #0x0
.L_4a8:
    ldr r2, _LIT1
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x2
    ldr r0, [r6, #0xa4]
    cmp r0, #0x8
    movgt r1, #0x8
    movle r1, r0
    cmp r3, r1
    addge sp, sp, #0x10
    subge r0, r0, #0x1
    ldmgeia sp!, {r4, r5, r6, pc}
    cmp r3, #0x0
    movlt r3, #0x0
    add r0, r4, r3
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word 0x2e8ba2e9
