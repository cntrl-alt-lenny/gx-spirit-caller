; func_020281e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern func_02006bf0
        .extern func_0201d70c
        .extern func_02022d00
        .extern func_02028338
        .global func_020281e4
        .arm
func_020281e4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r6, r0
    ldrh r0, [r6, #0xde]
    movs r4, r2
    mov r5, r1
    bic r0, r0, #0x8
    strh r0, [r6, #0xde]
    ldr r0, [r6, #0xd0]
    bpl .L_40
    cmp r0, #0x0
    beq .L_148
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r6, #0xd0]
    b .L_148
.L_40:
    cmp r0, #0x0
    bne .L_c0
    ldrh r0, [r6, #0xde]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    beq .L_c0
    ldrb r0, [r6, #0x6c]
    mov r1, #0x4
    mov r2, #0x0
    cmp r0, #0x1
    moveq r0, #0x100
    movne r0, #0x10
    mov r8, r0, lsl #0x1
    mov r0, r8
    bl Task_PostLocked
    str r0, [r6, #0xd0]
    mov r1, r0
    mov r2, r8
    mov r0, #0x0
    bl Fill32
    ldr r0, [r6, #0x68]
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r9, [r6, #0xd0]
    mov r7, r0
    bl func_0201d70c
    mov r1, r9
    mov r2, r8
    bl Copy32
    mov r0, r7
    bl Task_InvokeLocked
.L_c0:
    strh r5, [r6, #0xd8]
    strh r4, [r6, #0xda]
    mov r0, #0x0
    strh r0, [r6, #0xdc]
    cmp r4, #0x0
    movne r0, #0x1
    ldrh r1, [r6, #0xde]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r6, #0xde]
    cmp r4, #0x0
    bne .L_148
    ldr r0, [r6, #0xd0]
    cmp r0, #0x0
    beq .L_148
    mov r2, #0x0
    mov r1, #0x2
    add r0, sp, #0x0
    str r2, [sp]
    str r6, [sp, #0x4]
    str r1, [sp, #0x8]
    bl func_02022d00
    mov r1, #0x2
    strh r1, [r6, #0xda]
    mov r1, #0x1
    mov r0, r6
    strh r1, [r6, #0xdc]
    bl func_02028338
    mov r0, #0x0
    strh r0, [r6, #0xda]
    strh r0, [r6, #0xdc]
.L_148:
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
