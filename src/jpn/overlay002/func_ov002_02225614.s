; func_ov002_02225614 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd34c
        .extern func_ov002_021b939c
        .extern func_ov002_021de3c0
        .global func_ov002_02225614
        .arm
func_ov002_02225614:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x16
    bne .L_2ec
    ldr r0, _LIT0
    ldr r1, [r4, #0x14]
    ldr r2, [r0, #0x38]
    mov r0, r1, lsl #0x17
    cmp r2, r0, lsr #0x17
    moveq r2, #0x1
    movne r2, #0x0
    mov r0, #0x38
    mul r1, r2, r0
    ldr r0, _LIT1
    ldr r0, [r0, r1]
    bl func_ov002_021b939c
    mov r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r2, r0, #0xff
    cmp r2, #0x4
    bhi .L_2ec
    mov r0, r4
    and r1, r1, #0xff
    bl func_ov002_021de3c0
.L_2ec:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cd34c
