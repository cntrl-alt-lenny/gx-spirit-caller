; func_ov002_021d8298 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf17c
        .extern func_ov002_021d479c
        .extern func_ov002_021e278c
        .extern func_ov002_021e30b4
        .extern func_ov002_02244fe4
        .global func_ov002_021d8298
        .arm
func_ov002_021d8298:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r6, r0
    ldr r0, _LIT0
    and r3, r6, #0x1
    mul ip, r3, r0
    mov r5, r1
    ldr r4, [r5]
    ldr r0, _LIT1
    mov r1, r4, lsl #0x2
    mov r1, r1, lsr #0x18
    ldr r0, [r0, ip]
    mov r7, r4, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r4, r2
    cmp r0, #0x0
    add r7, r1, r7, lsr #0x1f
    mov r0, #0x0
    bls .L_15c
    ldr r1, _LIT2
    add r2, r1, ip
    add r1, r2, #0x260
    ldr r2, [r2, #0x10]
.L_5c:
    ldr r8, [r1]
    mov lr, r8, lsl #0x2
    mov lr, lr, lsr #0x18
    mov r8, r8, lsl #0x12
    mov lr, lr, lsl #0x1
    add r8, lr, r8, lsr #0x1f
    cmp r7, r8
    bne .L_14c
    ldr r0, _LIT3
    ldr r1, [sp]
    ldr ip, [r0, ip]
    bic r1, r1, #0x200
    mov r0, r6, lsl #0x1f
    orr r0, r1, r0, lsr #0x16
    mov r1, #0x200
    rsb r1, r1, #0x0
    orr r0, r0, #0x400
    mov lr, r7, lsl #0x16
    orr r2, r3, #0x1a
    orr r2, r2, lr, lsr #0x10
    mov r2, r2, lsl #0x10
    mov ip, ip, lsl #0x16
    orr r3, r3, #0x16
    orr r3, r3, ip, lsr #0x10
    mov r3, r3, lsl #0x10
    and ip, r0, r1
    and r0, r7, r1, lsr #0x17
    orr ip, ip, r0
    mov r1, r2, lsr #0x10
    mov r2, r3, lsr #0x10
    mov r0, #0x3f
    mov r3, #0x0
    str ip, [sp]
    bl func_ov002_021d479c
    cmp r4, #0x0
    beq .L_f8
    mov r0, r6
    mov r1, r7
    bl func_ov002_021e278c
.L_f8:
    ldr r1, [r5]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x13
    mov r3, r1, lsr #0x13
    cmp r3, r0
    bne .L_134
    mov r0, r6, lsl #0x1f
    and r0, r0, #-2147483648
    mov r1, r7, lsl #0x10
    orr r2, r0, #0x500000
    mov r0, r3, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
.L_134:
    ldr r1, [sp]
    mov r0, #0x1a
    bl func_ov002_02244fe4
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_14c:
    add r0, r0, #0x1
    cmp r0, r2
    add r1, r1, #0x4
    bcc .L_5c
.L_15c:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf178
_LIT4: .word 0x000017cc
