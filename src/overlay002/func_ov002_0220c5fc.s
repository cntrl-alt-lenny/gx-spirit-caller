; func_ov002_0220c5fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a8
        .extern func_ov002_0220736c
        .extern func_ov002_02207a70
        .global func_ov002_0220c5fc
        .arm
func_ov002_0220c5fc:
    stmdb sp!, {r4, lr}
    ldrh r3, [r0, #0x2]
    mov r2, r3, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x6
    beq .L_2c
    cmp r2, #0xf
    beq .L_34
    cmp r2, #0x16
    beq .L_70
    b .L_ac
.L_2c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_34:
    mov r2, r3, lsl #0x1f
    mov r4, r2, lsr #0x1f
    mov r3, r3, lsl #0x1a
    ldr r2, _LIT0
    ldr ip, _LIT1
    and lr, r4, #0x1
    mov r4, r3, lsr #0x1b
    mov r3, #0x14
    mul r3, r4, r3
    mla r2, lr, r2, ip
    ldr r2, [r3, r2]
    tst r2, #0x2
    beq .L_ac
    bl func_ov002_0220736c
    ldmia sp!, {r4, pc}
.L_70:
    mov r2, r3, lsl #0x1f
    mov ip, r2, lsr #0x1f
    mov r3, r3, lsl #0x1a
    ldr r2, _LIT0
    ldr lr, _LIT1
    and r4, ip, #0x1
    mov ip, r3, lsr #0x1b
    mov r3, #0x14
    mul r3, ip, r3
    mla r2, r4, r2, lr
    ldr r2, [r3, r2]
    tst r2, #0x4
    beq .L_ac
    bl func_ov002_02207a70
    ldmia sp!, {r4, pc}
.L_ac:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
