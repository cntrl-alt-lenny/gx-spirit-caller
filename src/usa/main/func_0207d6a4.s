; func_0207d6a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_0207d8ac
        .extern func_0207d8dc
        .extern func_0207d90c
        .extern func_0207d934
        .global func_0207d6a4
        .arm
func_0207d6a4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x18
    mov r7, r0
    add r0, sp, #0x0
    mov r8, r1
    mov r6, r2
    mov r5, r3
    bl func_0207d934
    ldr r3, [sp, #0x4]
    sub r4, r6, #0x10
    add r2, r5, r6
    mov r0, r7
    mov r1, r8
    str r4, [sp, #0x4]
    str r3, [sp, #0xc]
    str r2, [sp, #0x8]
    bl func_0207d90c
    ldr r2, [sp]
    ldr r1, [sp, #0x4]
    mov r5, r0
    sub r0, r1, r2
    cmp r0, #0x10
    strcc r2, [sp, #0x4]
    bcc .L_80
    ldr r1, _LIT0
    add r0, sp, #0x0
    bl func_0207d8ac
    mov r1, r0
    mov r0, r7
    mov r2, r5
    bl func_0207d8dc
    mov r5, r0
.L_80:
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x8]
    sub r0, r1, r0
    cmp r0, #0x10
    strcc r1, [sp, #0x8]
    bcc .L_b4
    ldr r1, _LIT0
    add r0, sp, #0x8
    bl func_0207d8ac
    mov r1, r0
    mov r0, r7
    mov r2, r5
    bl func_0207d8dc
.L_b4:
    ldr r0, [r7, #-4]
    ldr r1, [sp, #0x4]
    and r0, r0, #0xff
    mov r0, r0, lsl #0x10
    ldr r2, [sp, #0x8]
    mov r0, r0, lsr #0x10
    sub r2, r2, r1
    ands r0, r0, #0x1
    beq .L_e0
    mov r0, #0x0
    bl Fill32
.L_e0:
    ldr r2, [sp, #0x8]
    ldr r1, _LIT1
    add r0, sp, #0x10
    str r4, [sp, #0x10]
    str r2, [sp, #0x14]
    bl func_0207d8ac
    mov r1, r0
    ldrh r3, [r1, #0x2]
    ldrh r2, [sp, #0x30]
    add r0, r7, #0x8
    bic r3, r3, #0x8000
    strh r3, [r1, #0x2]
    ldrh r3, [r1, #0x2]
    and r2, r2, #0x1
    orr r2, r3, r2, lsl #0xf
    strh r2, [r1, #0x2]
    ldrh r2, [r1, #0x2]
    ldr r3, [sp, #0x4]
    bic r2, r2, #0x7f00
    strh r2, [r1, #0x2]
    sub r2, r1, r3
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    ldrh r3, [r1, #0x2]
    and r2, r2, #0x7f
    orr r2, r3, r2, lsl #0x8
    strh r2, [r1, #0x2]
    ldrh r2, [r1, #0x2]
    ldrh r3, [r7, #0x10]
    bic r2, r2, #0xff
    strh r2, [r1, #0x2]
    ldrh r2, [r1, #0x2]
    and r3, r3, #0xff
    orr r2, r2, r3
    strh r2, [r1, #0x2]
    ldr r2, [r7, #0xc]
    bl func_0207d8dc
    mov r0, r6
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00004652
_LIT1: .word 0x00005544
