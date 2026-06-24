; func_02037c50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Div
        .extern data_0219b2f0
        .extern data_0219b2fc
        .global func_02037c50
        .arm
func_02037c50:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x34]
    mov r4, #0x0
    tst r1, #0x1000000
    beq .L_20
    mov r4, #0x1
    tst r1, #0x2000000
    movne r4, #0x2
.L_20:
    ldrb r1, [r0, #0x28]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrsb r2, [r0, #0x26]
    ldrb r0, [r0, #0x27]
    mov r1, #0x7f
    smulbb r0, r2, r0
    bl Div
    ldr r2, _LIT0
    mov r1, #0x7f
    ldr r2, [r2, r4, lsl #0x4]
    mov r2, r2, asr #0x8
    mul r2, r0, r2
    mov r0, r2
    bl Div
    ldr r1, _LIT1
    mov r2, r4, lsl #0x4
    ldrh r2, [r1, r2]
    mov r1, #0x7f
    mul r2, r0, r2
    mov r0, r2
    bl Div
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219b2f0
_LIT1: .word data_0219b2fc
