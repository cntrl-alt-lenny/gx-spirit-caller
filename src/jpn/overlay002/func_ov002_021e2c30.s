; func_ov002_021e2c30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a8
        .extern func_ov002_021c9a4c
        .extern func_ov002_021d46ac
        .global func_ov002_021e2c30
        .arm
func_ov002_021e2c30:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r3, _LIT0
    and r4, r6, #0x1
    mul ip, r4, r3
    ldr r3, _LIT1
    mov r5, r1
    ldr r3, [r3, ip]
    mov r4, r2
    mov r3, r3, lsr r5
    and r3, r3, #0x1
    cmp r4, r3
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_ov002_021c9a4c
    cmp r6, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x22
    mov r0, r0, lsl #0x10
    mov r1, r5, lsl #0x10
    mov r2, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d46ac
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
