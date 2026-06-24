; func_020615fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021013fc
        .extern data_02101404
        .extern func_02064a2c
        .extern func_020a6c60
        .global func_020615fc
        .arm
func_020615fc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bne .L_30
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x160
    bl func_020a6c60
.L_30:
    cmp r7, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [sp, #0x2c]
    cmp r0, #0x0
    ldrne ip, [r7, #0x28]
    ldreq ip, [r7, #0x2c]
    cmp ip, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_78
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    bne .L_84
.L_78:
    mov r0, #0x0
    str r0, [sp, #0x24]
    str r0, [sp, #0x28]
.L_84:
    ldr r0, [r7, #0x1c]
    cmp r6, #0x0
    add r0, r0, #0x1
    str r0, [r7, #0x1c]
    ldrne r0, [r6, #0x24]
    ldr r1, [sp, #0x20]
    addne r0, r0, #0x1
    strne r0, [r6, #0x24]
    str r1, [sp]
    ldr r0, [sp, #0x24]
    ldr lr, [sp, #0x28]
    str r0, [sp, #0x4]
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    str lr, [sp, #0x8]
    blx ip
    ldr r0, [r7, #0x1c]
    cmp r6, #0x0
    sub r0, r0, #0x1
    str r0, [r7, #0x1c]
    ldrne r0, [r6, #0x24]
    subne r0, r0, #0x1
    strne r0, [r6, #0x24]
    ldr r0, [r7, #0x14]
    cmp r0, #0x0
    beq .L_114
    ldr r0, [r7, #0x1c]
    cmp r0, #0x0
    bne .L_114
    mov r0, r7
    bl func_02064a2c
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_114:
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021013fc
_LIT1: .word data_02101404
