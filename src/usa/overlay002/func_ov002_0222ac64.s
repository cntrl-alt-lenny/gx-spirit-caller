; func_ov002_0222ac64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern func_ov002_021d6718
        .global func_ov002_0222ac64
        .arm
func_ov002_0222ac64:
    stmdb sp!, {r3, r4, r5, lr}
    ldr lr, [r0, #0x14]
    ldr r2, _LIT0
    mov r1, lr, lsl #0x16
    mov r1, r1, lsr #0x1f
    and r4, r1, #0x1
    mov r5, lr, lsl #0x12
    mul r3, r4, r2
    ldr r4, _LIT1
    mov r2, r5, lsr #0x1c
    mov ip, #0x14
    add r4, r4, r3
    mul ip, r2, ip
    add r4, r4, #0x30
    ldr r4, [r4, ip]
    mov r5, lr, lsl #0x17
    mov lr, r4, lsl #0x2
    mov lr, lr, lsr #0x18
    mov r4, r4, lsl #0x12
    mov lr, lr, lsl #0x1
    add r4, lr, r4, lsr #0x1f
    cmp r4, r5, lsr #0x17
    bne .L_414
    ldr lr, _LIT2
    add lr, lr, r3
    ldrh lr, [ip, lr]
    cmp lr, #0x0
    beq .L_414
    ldr lr, _LIT3
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    bne .L_414
    mov r3, #0x0
    str r3, [sp]
    bl func_ov002_021d6718
.L_414:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0c2
