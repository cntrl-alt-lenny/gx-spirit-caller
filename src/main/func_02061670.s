; func_02061670 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021014dc
        .extern data_021014e4
        .extern func_02064aa0
        .extern func_020a6d54
        .global func_02061670
        .arm
func_02061670:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bne .L_160
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x160
    bl func_020a6d54
.L_160:
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
    beq .L_1a8
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    bne .L_1b4
.L_1a8:
    mov r0, #0x0
    str r0, [sp, #0x24]
    str r0, [sp, #0x28]
.L_1b4:
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
    beq .L_244
    ldr r0, [r7, #0x1c]
    cmp r0, #0x0
    bne .L_244
    mov r0, r7
    bl func_02064aa0
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_244:
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021014dc
_LIT1: .word data_021014e4
