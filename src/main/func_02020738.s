; func_02020738 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191f40
        .global func_02020738
        .arm
func_02020738:
    stmdb sp!, {r3, lr}
    mov r3, #0x0
    mov r1, r3
    mov lr, r3
    mov ip, #0x1
.L_74:
    tst r0, ip, lsl lr
    beq .L_94
    add r3, lr, #0x1
    add r2, r1, #0x1
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r1, asr #0x10
    mov r1, r2, lsr #0x10
.L_94:
    add r2, lr, #0x1
    mov r2, r2, lsl #0x10
    mov lr, r2, asr #0x10
    cmp lr, #0x10
    blt .L_74
    cmp r1, #0x1
    movls r0, r3
    ldmlsia sp!, {r3, pc}
    ldr ip, _LIT0
    ldr r3, _LIT1
    ldr lr, [ip, #0x34]
    mov r2, #0x0
    mul r3, lr, r3
    add r3, r3, #0x39
    add lr, r3, #0x3000
    and r3, lr, #0xff
    mul r3, r1, r3
    mov r1, r3, lsl #0x8
    str lr, [ip, #0x34]
    mov r3, r1, lsr #0x10
.L_e4:
    tst r0, #0x1
    beq .L_110
    cmp r3, #0x0
    bne .L_104
    add r0, r2, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    ldmia sp!, {r3, pc}
.L_104:
    sub r1, r3, #0x1
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
.L_110:
    add r1, r2, #0x1
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0xf
    mov r2, r1, asr #0x10
    cmp r2, #0x10
    mov r0, r0, lsr #0x10
    blt .L_e4
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191f40
_LIT1: .word 0x00010dcd
