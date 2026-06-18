; func_ov002_022920dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bbd14
        .extern func_ov002_02280980
        .global func_ov002_022920dc
        .arm
func_ov002_022920dc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbd14
    ldrh r2, [r6, #0x2]
    mov r5, r0
    mov r1, #0x1400
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbd14
    ldrh r2, [r6, #0x2]
    mov r4, r0
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbd14
    ldrh r2, [r6, #0x2]
    mov r7, r0
    ldr r1, _LIT2
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbd14
    add r0, r7, r0
    ldrh r1, [r6, #0x2]
    add r2, r4, r0
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xa
    movls r1, #0x1
    add r0, r5, r2
    movhi r1, #0x0
    sub r0, r0, r1
    cmp r0, #0x0
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280980
    cmp r0, #0x0
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x0000187c
_LIT1: .word 0x00001102
_LIT2: .word 0x0000134a
