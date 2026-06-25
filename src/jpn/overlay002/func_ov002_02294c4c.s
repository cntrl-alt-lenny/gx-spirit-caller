; func_ov002_02294c4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021bb82c
        .extern func_ov002_021c83c8
        .global func_ov002_02294c4c
        .arm
func_ov002_02294c4c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb82c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r8, _LIT1
    mov r5, #0x0
    ldr r4, _LIT2
    mov r6, r5
    sub r9, r8, #0x15c
.L_3c:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r1, r0, #0x1
    mla r2, r1, r9, r4
    add r2, r2, r6
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    ldrneh r1, [r2, #0x38]
    cmpne r1, #0x0
    beq .L_84
    mov r1, r5
    bl func_ov002_021c83c8
    cmp r0, r8
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_84:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r6, r6, #0x14
    blt .L_3c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000fbc
_LIT1: .word 0x000009c4
_LIT2: .word data_ov002_022cf08c
