; func_ov002_022872bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .global func_ov002_022872bc
        .arm
func_ov002_022872bc:
    ldr r1, _LIT0
    ldr r1, [r1, #0xcf8]
    cmp r1, #0x5
    bne .L_78
    ldrh r1, [r0, #0x2]
    ldr r2, _LIT1
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    and r1, r1, #0x1
    mla ip, r1, r0, r2
    add r2, ip, #0x94
    mov r1, #0x5
    mov r3, #0x64
.L_3c:
    ldr r0, [r2]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_64
    add r0, ip, r3
    ldr r0, [r0, #0x40]
    mov r0, r0, lsr #0x14
    tst r0, #0x1
    movne r0, #0x1
    bxne lr
.L_64:
    add r1, r1, #0x1
    cmp r1, #0xa
    add r2, r2, #0x14
    add r3, r3, #0x14
    ble .L_3c
.L_78:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
