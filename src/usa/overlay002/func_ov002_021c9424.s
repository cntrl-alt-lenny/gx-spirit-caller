; func_ov002_021c9424 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd3d8
        .extern data_ov002_022cd3ec
        .extern data_ov002_022cf08c
        .global func_ov002_021c9424
        .arm
func_ov002_021c9424:
    sub r3, r1, #0xb
    cmp r3, #0x4
    addls pc, pc, r3, lsl #0x2
    b .L_d8
    b .L_b4
    b .L_24
    b .L_48
    b .L_6c
    b .L_90
.L_24:
    ldr r1, _LIT0
    ldr r3, _LIT1
    and ip, r0, #0x1
    mla r0, ip, r1, r3
    add r0, r0, r2, lsl #0x2
    ldr r0, [r0, #0x3a0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bx lr
.L_48:
    ldr r1, _LIT0
    ldr r3, _LIT1
    and ip, r0, #0x1
    mla r0, ip, r1, r3
    add r0, r0, r2, lsl #0x2
    ldr r0, [r0, #0x260]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bx lr
.L_6c:
    ldr r1, _LIT0
    ldr r3, _LIT1
    and ip, r0, #0x1
    mla r0, ip, r1, r3
    add r0, r0, r2, lsl #0x2
    ldr r0, [r0, #0x418]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bx lr
.L_90:
    ldr r1, _LIT0
    ldr r3, _LIT1
    and ip, r0, #0x1
    mla r0, ip, r1, r3
    add r0, r0, r2, lsl #0x2
    ldr r0, [r0, #0x5d0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bx lr
.L_b4:
    ldr r1, _LIT0
    ldr r3, _LIT1
    and ip, r0, #0x1
    mla r0, ip, r1, r3
    add r0, r0, r2, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bx lr
.L_d8:
    add r3, r1, r2
    cmp r3, #0xa
    ble .L_110
    ldr r2, _LIT2
    ldr r3, [r2]
    cmp r0, r3
    ldreq r0, [r2, #0x1c]
    cmpeq r1, r0
    ldreq r0, _LIT3
    ldrne r0, _LIT4
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bx lr
.L_110:
    ldr r1, _LIT0
    ldr r2, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r2
    mov r0, #0x14
    mla r0, r3, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cd314
_LIT3: .word data_ov002_022cd3d8
_LIT4: .word data_ov002_022cd3ec
