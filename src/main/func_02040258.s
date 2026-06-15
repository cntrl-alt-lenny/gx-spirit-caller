; func_02040258 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9d4
        .extern func_020945f4
        .extern func_02094688
        .global func_02040258
        .arm
func_02040258:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_bb0
    mov r1, #0x0
    mov r2, #0x1c4
    bl func_020945f4
.L_bb0:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1]
    mov r1, r4
    add r0, r2, r0
    mov r2, #0x1c4
    bl func_02094688
    ldr r1, [r4]
    ldr r0, _LIT2
    cmp r1, r0
    blt .L_be8
    ldr r0, _LIT3
    cmp r1, r0
    blt .L_bf0
.L_be8:
    ldr r0, _LIT4
    str r0, [r4]
.L_bf0:
    ldr r1, [r4]
    ldr r0, _LIT5
    cmp r1, r0
    rsbge r0, r1, #0x0
    strge r0, [r4]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219d9d4
_LIT1: .word 0x00001008
_LIT2: .word 0x00004e20
_LIT3: .word 0x00007530
_LIT4: .word 0x00005206
_LIT5: .word 0x00004e84
