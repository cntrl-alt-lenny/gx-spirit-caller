; func_02029d40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_020c6958
        .extern func_02006c0c
        .extern func_02007104
        .extern func_0201d760
        .extern func_0201ede4
        .extern func_02022d54
        .extern func_02029f74
        .extern func_0202be4c
        .global func_02029d40
        .arm
func_02029d40:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    mov r7, r0
    add r0, r7, #0x100
    ldrh r3, [r0, #0x9a]
    mov r6, r1
    movs r5, r2
    bic r1, r3, #0x10
    strh r1, [r0, #0x9a]
    bpl .L_6b8
    ldr r0, [r7, #0x188]
    cmp r0, #0x0
    beq .L_898
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r7, #0x188]
    b .L_898
.L_6b8:
    ldr r1, [r7, #0x188]
    cmp r1, #0x0
    bne .L_800
    ldrh r0, [r0, #0x9a]
    mov r1, #0x4
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    beq .L_7a0
    ldrb r0, [r7, #0x6c]
    mov r2, #0x0
    cmp r0, #0x1
    moveq r0, #0x100
    movne r0, #0x10
    mov r4, r0, lsl #0x1
    mov r0, r4
    bl Task_PostLocked
    str r0, [r7, #0x188]
    mov r1, r0
    mov r2, r4
    mov r0, #0x0
    bl Fill32
    ldr r0, [r7, #0x68]
    ldr r1, _LIT0
    bl func_02007104
    cmp r0, #0x0
    blt .L_768
    ldr r1, [r7, #0x68]
    mov r2, #0x64
    ldrsb r3, [r1, #0x9]
    ldrsb lr, [r1, #0x8]
    ldrsb r0, [r1, #0xa]
    sub r3, r3, #0x30
    mul ip, r3, r2
    sub r3, lr, #0x30
    mov r2, #0x3e8
    mla r2, r3, r2, ip
    ldrsb r3, [r1, #0xb]
    sub r1, r0, #0x30
    mov r0, #0xa
    mla r0, r1, r0, r2
    sub r1, r3, #0x30
    add r0, r1, r0
    bl func_0202be4c
    b .L_778
.L_768:
    ldr r0, [r7, #0x68]
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
.L_778:
    mov r8, r0
    ldr r9, [r7, #0x188]
    mov r0, r8
    bl func_0201d760
    mov r1, r9
    mov r2, r4
    bl Copy32
    mov r0, r8
    bl Task_InvokeLocked
    b .L_800
.L_7a0:
    ldrb r0, [r7, #0x78]
    mov r2, #0x0
    cmp r0, #0x1
    moveq r0, #0x100
    movne r0, #0x10
    mov r4, r0, lsl #0x1
    mov r0, r4
    bl Task_PostLocked
    str r0, [r7, #0x188]
    mov r1, r0
    mov r2, r4
    mov r0, #0x0
    bl Fill32
    ldr r1, [r7, #0x6c]
    add r0, sp, #0x0
    bl func_0201ede4
    mov r2, r4
    ldr r1, [sp]
    mov r4, r0
    ldr r0, [r1, #0xc]
    ldr r1, [r7, #0x188]
    bl Copy32
    mov r0, r4
    bl Task_InvokeLocked
.L_800:
    add r0, r7, #0x100
    strh r6, [r0, #0x92]
    strh r5, [r0, #0x94]
    mov r3, #0x0
    strh r3, [r0, #0x96]
    add r1, r7, #0x100
    cmp r5, #0x0
    movne r3, #0x1
    ldrh r2, [r1, #0x9a]
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x10
    mov r0, r0, lsl #0x1f
    orr r0, r2, r0, lsr #0x1b
    strh r0, [r1, #0x9a]
    cmp r5, #0x0
    bne .L_898
    ldr r0, [r7, #0x188]
    cmp r0, #0x0
    beq .L_898
    mov r2, #0x0
    mov r1, #0x2
    add r0, sp, #0x4
    str r2, [sp, #0x4]
    str r7, [sp, #0x8]
    str r1, [sp, #0xc]
    bl func_02022d54
    add r1, r7, #0x100
    mov r2, #0x2
    strh r2, [r1, #0x94]
    mov r2, #0x1
    mov r0, r7
    strh r2, [r1, #0x96]
    bl func_02029f74
    add r0, r7, #0x100
    mov r1, #0x0
    strh r1, [r0, #0x94]
    strh r1, [r0, #0x96]
.L_898:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_020c6958
