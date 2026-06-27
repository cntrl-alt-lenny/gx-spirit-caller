; func_ov002_021d1364 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022cf1a8
        .extern func_ov002_0229acd0
        .global func_ov002_021d1364
        .arm
func_ov002_021d1364:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r2, #0x1
    ldrh r1, [r0, #0x4]
    moveq r2, #0x0
    ldrh ip, [r0, #0x2]
    cmp r1, #0x0
    ldr r0, _LIT1
    and r1, r2, #0x1
    beq .L_4c
    mul r2, r1, r0
    ldr r3, _LIT2
    mov r0, #0x1
    ldr r1, [r3, r2]
    orr r0, r1, r0, lsl ip
    b .L_64
.L_4c:
    mul r2, r1, r0
    ldr r3, _LIT2
    mov r0, #0x1
    mvn r0, r0, lsl ip
    ldr r1, [r3, r2]
    and r0, r1, r0
.L_64:
    mov r1, #0x0
    str r0, [r3, r2]
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a8
