; func_020a5940 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9844
        .extern data_021a9848
        .global func_020a5940
        .arm
func_020a5940:
    ldr r1, _LIT0
    mov ip, #0x0
    ldr r2, [r1, #0x4]
    cmp r2, #0x0
    ble .L_1f0
    ldr r1, _LIT1
    sub r0, r0, #0x1
    ldr r1, [r1]
    add r0, r1, r0, lsl #0x2
    ldr r3, [r0, #0x1e0]
    mov r1, #0x1
.L_1cc:
    mov r0, r1, lsl ip
    ands r0, r0, r3
    moveq r0, #0x0
    bxeq lr
    add r0, ip, #0x1
    mov r0, r0, lsl #0x10
    mov ip, r0, lsr #0x10
    cmp ip, r2
    blt .L_1cc
.L_1f0:
    mov r0, #0x1
    bx lr
_LIT0: .word data_021a9848
_LIT1: .word data_021a9844
