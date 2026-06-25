; func_ov002_02208130 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf098
        .extern func_ov002_021bb83c
        .extern func_ov002_02207f4c
        .global func_ov002_02208130
        .arm
func_ov002_02208130:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, _LIT0
    mov r4, r1
    bl func_ov002_021bb83c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_02207f4c
    cmp r0, #0x0
    beq .L_68
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    movne r0, #0x2
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_68:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000175e
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
