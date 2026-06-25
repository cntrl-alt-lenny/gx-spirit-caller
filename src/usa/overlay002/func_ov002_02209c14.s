; func_ov002_02209c14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .global func_ov002_02209c14
        .arm
func_ov002_02209c14:
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0xd
    cmpne r1, #0x14
    bne .L_94
    ldr r2, _LIT0
    ldr r1, [r2, #0x8]
    cmp r1, #0x0
    bne .L_94
    ldrh r1, [r0, #0x2]
    ldr r0, [r2]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    beq .L_94
    ldr r0, [r2, #0x4]
    cmp r0, r1, lsr #0x1f
    bne .L_94
    ldr r1, _LIT1
    and r3, r0, #0x1
    ldr ip, [r2, #0x20]
    mov r0, #0x14
    mul r2, r3, r1
    ldr r1, _LIT2
    mul r3, ip, r0
    add r0, r1, r2
    add r0, r0, r3
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_94
    ldr r0, _LIT3
    add r0, r0, r2
    ldrh r0, [r3, r0]
    cmp r0, #0x0
    movne r0, #0x1
    bxne lr
.L_94:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022cd314
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0c4
