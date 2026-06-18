; func_ov002_021d13e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022d016c
        .extern func_ov002_0229ade0
        .global func_ov002_021d13e0
        .arm
func_ov002_021d13e0:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldrh r1, [r0, #0x4]
    ldrh r3, [r0, #0x2]
    cmp r1, #0x0
    mov r1, #0x1
    beq .L_2c
    ldr r0, _LIT1
    ldr r2, [r0, #0xd0]
    orr r1, r2, r1, lsl r3
    b .L_3c
.L_2c:
    ldr r0, _LIT1
    mvn r1, r1, lsl r3
    ldr r2, [r0, #0xd0]
    and r1, r2, r1
.L_3c:
    str r1, [r0, #0xd0]
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022d016c
