; func_ov011_021cd268 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d32d8
        .extern data_ov011_021d334a
        .extern data_ov011_021d4000
        .global func_ov011_021cd268
        .arm
func_ov011_021cd268:
    ldr r1, _LIT0
    sub r3, r0, #0x65
    ldr r1, [r1, #0x2a4]
    mov r0, #0x72
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x1c
    mul r2, r1, r0
    ldr r1, _LIT1
    mov r0, #0x0
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    ble .L_1e4
    ldr r1, _LIT2
    add ip, r1, r2
    ldrb r1, [ip, #-114]
.L_1c8:
    ldrb r2, [ip, #-113]
    cmp r3, r2
    bxeq lr
    add r0, r0, #0x1
    cmp r0, r1
    add ip, ip, #0x1
    blt .L_1c8
.L_1e4:
    mvn r0, #0x0
    bx lr
_LIT0: .word data_ov011_021d4000
_LIT1: .word data_ov011_021d32d8
_LIT2: .word data_ov011_021d334a
