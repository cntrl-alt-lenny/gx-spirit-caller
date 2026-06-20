; func_ov002_02291bfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c4c9c
        .extern func_ov002_02280a1c
        .global func_ov002_02291bfc
        .arm
func_ov002_02291bfc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x34
    mov r8, r0
    ldrh r0, [r8, #0x2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x1
    bl func_ov002_02280a1c
    mov r6, #0x0
    ldr r5, _LIT0
    ldr r9, _LIT1
    mov r7, r6
    add r4, sp, #0x8
.L_3c:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r1, r0, #0x1
    mla r2, r1, r9, r5
    add r2, r2, r7
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    ldrneh r1, [r2, #0x38]
    cmpne r1, #0x0
    beq .L_f0
    mov r1, r6
    mov r2, r4
    bl func_ov002_021c4c9c
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r1, r0, #0x1
    mla r0, r1, r9, r5
    add r0, r7, r0
    ldrh r0, [r0, #0x36]
    cmp r0, #0x0
    beq .L_cc
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x20]
    cmp r0, r1
    ble .L_f0
    ldr r0, [sp, #0x1c]
    cmp r0, r1
    bge .L_f0
    add sp, sp, #0x34
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_cc:
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x1c]
    cmp r0, r1
    ble .L_f0
    ldr r0, [sp, #0x20]
    cmp r0, r1
    addlt sp, sp, #0x34
    movlt r0, #0x1
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_f0:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r7, r7, #0x14
    ble .L_3c
    mov r0, #0x0
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
