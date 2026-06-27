; func_ov002_02286f14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202b83c
        .global func_ov002_02286f14
        .arm
func_ov002_02286f14:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r6, #0x0
    ldr r4, _LIT0
    ldr sl, _LIT1
    mov r9, r0
    mov r5, r6
    mov r8, r6
.L_1c:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r0, r0, #0x1
    mla r1, r0, sl, r4
    add r1, r1, r8
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    movs r7, r0, lsr #0x13
    ldrneh r0, [r1, #0x38]
    cmpne r0, #0x0
    beq .L_88
    mov r0, r7
    bl func_0202b83c
    cmp r6, r0
    beq .L_88
    mov r0, r7
    bl func_0202b83c
    cmp r0, #0x6
    bgt .L_88
    cmp r6, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r7
    bl func_0202b83c
    mov r6, r0
.L_88:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r8, r8, #0x14
    ble .L_1c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
