; func_ov002_0226d86c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern func_ov002_021b1120
        .extern func_ov002_021bcca0
        .extern func_ov002_0226d724
        .extern func_ov002_02271708
        .global func_ov002_0226d86c
        .arm
func_ov002_0226d86c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r4, r1
    ldr r1, [r2]
    and r5, r0, #0x1
    bic ip, r1, #0x1
    ldr r1, _LIT1
    orr r5, ip, r5
    and r5, r5, r1
    mov r1, r4, lsl #0x11
    orr r1, r5, r1, lsr #0x9
    str r1, [r2]
    ldrh r5, [r2, #0x16]
    mov r3, #0x0
    sub r1, r3, #0x1
    orr r5, r5, #0x2
    strh r5, [r2, #0x16]
    strb r3, [r2, #0x8]
    bl func_ov002_021bcca0
    mov r5, r0
    mov r0, r4
    bl func_ov002_0226d724
    cmp r5, r0
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    bl func_ov002_021b1120
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0xff8000ff
_LIT2: .word func_ov002_02271708
