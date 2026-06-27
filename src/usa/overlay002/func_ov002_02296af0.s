; func_ov002_02296af0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bb82c
        .extern func_ov002_021c3a04
        .global func_ov002_02296af0
        .arm
func_ov002_02296af0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb82c
    cmp r0, #0x0
    beq .L_44
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3a04
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_44:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb82c
    cmp r0, #0x0
    beq .L_80
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3a04
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_80:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000160a
_LIT1: .word 0x00001620
_LIT2: .word 0x0000190b
_LIT3: .word 0x00001917
