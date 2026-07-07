; func_ov002_0225737c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022be09c
        .extern data_ov002_022bf2b4
        .extern data_ov002_022c07b4
        .extern data_ov002_022c346c
        .global func_ov002_0225737c
        .arm
func_ov002_0225737c:
    stmdb sp!, {r4, lr}
    ldrh r3, [r0, #0x2]
    ldrh r2, [r0]
    mov r0, #0x0
    mov ip, r3, lsl #0x12
    mov ip, ip, lsr #0x1e
    cmp ip, #0x3
    addls pc, pc, ip, lsl #0x2
    b .L_74
    b .L_34
    b .L_40
    b .L_4c
    b .L_6c
.L_34:
    ldr r1, _LIT0
    ldr r4, _LIT1
    b .L_74
.L_40:
    ldr r1, _LIT2
    mov r4, #0x1dc
    b .L_74
.L_4c:
    mov r1, r3, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    ldreq r1, _LIT0
    ldreq r4, _LIT1
    ldrne r1, _LIT3
    movne r4, #0xc0
    b .L_74
.L_6c:
    ldr r1, _LIT4
    mov r4, #0xdf
.L_74:
    cmp r4, #0x0
    ble .L_a8
    mov ip, #0x18
.L_80:
    add r3, r0, r4
    add r3, r3, r3, lsr #0x1f
    mov lr, r3, asr #0x1
    mul r3, lr, ip
    ldr r3, [r1, r3]
    cmp r3, r2
    addcc r0, lr, #0x1
    movcs r4, lr
    cmp r0, r4
    blt .L_80
.L_a8:
    mov r3, #0x18
    mul r3, r0, r3
    ldr r0, [r1, r3]
    cmp r2, r0
    addeq r0, r1, r3
    movne r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022c346c
_LIT1: .word 0x0000032b
_LIT2: .word data_ov002_022c07b4
_LIT3: .word data_ov002_022be09c
_LIT4: .word data_ov002_022bf2b4
