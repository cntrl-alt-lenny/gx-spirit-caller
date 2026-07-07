; func_ov002_022582cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_0202b824
        .extern func_ov002_021e2500
        .extern func_ov002_021e2c30
        .extern func_ov002_021e302c
        .extern func_ov002_021e3264
        .global func_ov002_022582cc
        .arm
func_ov002_022582cc:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    mov ip, r0
    ldr r0, [r3, #0xd68]
    cmp r0, #0x0
    bne .L_40
    ldr r0, [r3, #0xd70]
    ldr r1, [r3, #0xd78]
    mov r2, ip
    bl func_ov002_021e2500
    ldr r1, _LIT0
    str r0, [r1, #0xd7c]
    ldr r0, [r1, #0xd68]
    add r0, r0, #0x1
    str r0, [r1, #0xd68]
    ldmia sp!, {r3, pc}
.L_40:
    cmp ip, #0x0
    beq .L_e4
    cmp r1, #0x0
    ldr r1, [r3, #0xd70]
    ldr r0, [r3, #0xd7c]
    beq .L_8c
    mov ip, r1, lsl #0x1f
    mov r1, r0, lsl #0x10
    ldr lr, [r3, #0xd5c]
    ldr r0, [r3, #0xd60]
    and r3, r1, #0x1f0000
    mov r1, r0, lsl #0x10
    and ip, ip, #-2147483648
    mov r0, lr, lsl #0x10
    orr r3, ip, r3
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e3264
    b .L_bc
.L_8c:
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x10
    ldr ip, [r3, #0xd5c]
    ldr r0, [r3, #0xd60]
    and r3, r2, #-2147483648
    and r2, r1, #0x1f0000
    mov r1, r0, lsl #0x10
    mov r0, ip, lsl #0x10
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e302c
.L_bc:
    ldr r0, _LIT0
    ldr r0, [r0, #0xd5c]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_e4
    ldr r0, _LIT0
    mov r1, #0x1a
    ldr r0, [r0, #0xd70]
    mov r2, #0x1
    bl func_ov002_021e2c30
.L_e4:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd50]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
