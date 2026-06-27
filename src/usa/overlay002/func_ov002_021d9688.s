; func_ov002_021d9688 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021e2fc4
        .global func_ov002_021d9688
        .arm
func_ov002_021d9688:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    mov r2, r2, lsl #0x1c
    mov r2, r2, lsr #0x1c
    cmp r2, #0xa
    bne .L_98
    ldrh r0, [r0]
    ldr r2, [r1]
    mov r3, r0, asr #0x8
    and r0, r0, #0xff
    mov r1, r2, lsl #0x16
    cmp r0, r1, lsr #0x1f
    and lr, r3, #0xff
    beq .L_98
    ldr r1, _LIT0
    ldr r3, _LIT1
    and ip, r0, #0x1
    mla r3, ip, r1, r3
    mov r1, #0x14
    mul ip, lr, r1
    add r1, r3, #0x30
    ldr r3, [r1, ip]
    ldr r1, _LIT2
    mov ip, r3, lsl #0x13
    cmp r1, ip, lsr #0x13
    bne .L_98
    mov r1, r3, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    mov ip, r0, lsl #0x1f
    add r0, r1, r3, lsr #0x1f
    mov r1, r0, lsl #0x10
    ldr r0, _LIT3
    and r3, ip, #-2147483648
    orr r0, r3, r0
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_98:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x000018d1
_LIT3: .word 0x2c4e18d1
