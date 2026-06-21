; func_ov002_021cd6f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf1a8
        .extern func_ov002_0229ade0
        .global func_ov002_021cd6f4
        .arm
func_ov002_021cd6f4:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    mov ip, #0x14
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r2, #0x1
    ldrh r1, [r0, #0x2]
    ldrh r4, [r0, #0x4]
    ldrh r3, [r0, #0x6]
    mov r0, r1, asr #0x8
    moveq r2, #0x0
    tst r0, #0xff
    orr r0, r4, r3, lsl #0x10
    and r1, r1, #0xff
    ldr r3, _LIT1
    beq .L_248
    ldr r4, _LIT2
    and r2, r2, #0x1
    mla r3, r2, r3, r4
    mul r2, r1, ip
    ldr r1, [r3, r2]
    add r0, r1, r0
    str r0, [r3, r2]
    b .L_25c
.L_248:
    ldr lr, _LIT2
    and r4, r2, #0x1
    mul r2, r1, ip
    mla r1, r4, r3, lr
    str r0, [r2, r1]
.L_25c:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a8
