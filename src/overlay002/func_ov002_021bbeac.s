; func_ov002_021bbeac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .global func_ov002_021bbeac
        .arm
func_ov002_021bbeac:
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r2, r0, #0x1
    mla r3, r2, r1, r3
    mov r1, #0x0
    mov ip, r1
    add r3, r3, #0x30
.L_1c:
    ldr r2, [r3]
    add ip, ip, #0x1
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    addne r1, r1, #0x1
    cmp ip, #0xa
    add r3, r3, #0x14
    ble .L_1c
    ldr r2, _LIT2
    ldr r2, [r2, #0xd0]
    tst r2, #0x1
    beq .L_8c
    ldr r2, _LIT3
    ldr r3, [r2]
    cmp r0, r3
    bne .L_6c
    ldr r2, [r2, #0xc4]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    addne r1, r1, #0x1
.L_6c:
    ldr r2, _LIT3
    ldr r3, [r2, #0x4]
    cmp r0, r3
    bne .L_8c
    ldr r0, [r2, #0xd8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    addne r1, r1, #0x1
.L_8c:
    mov r0, r1
    bx lr
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022cd3f4
