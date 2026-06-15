; func_020a2c74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a2c74
        .arm
func_020a2c74:
    mov r2, r1, asr #0x1
    cmp r2, #0x0
    mov r3, #0x0
    ble .L_e30
.L_e1c:
    ldrh r1, [r0], #0x2
    sub r2, r2, #0x1
    cmp r2, #0x0
    add r3, r3, r1
    bgt .L_e1c
.L_e30:
    ldr r0, _LIT0
    and r1, r3, r0
    add r1, r1, r3, lsr #0x10
    add r1, r1, r1, lsr #0x10
    eor r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bx lr
_LIT0: .word 0x0000ffff
