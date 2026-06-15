; func_020900a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_0210249c
        .extern data_021a6340
        .extern func_02093e38
        .global func_020900a0
        .arm
func_020900a0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    ldr ip, _LIT0
    ldr r3, _LIT1
    ldr r4, [ip]
    ldr lr, [r3]
    mvn ip, #0x0
    mov r5, r0
    mov r3, r2
    cmp lr, ip
    add r4, r4, r1
    beq .L_d6c
    mov ip, #0x0
    str ip, [sp]
    mov r0, lr
    mov r1, r5
    mov r2, r4
    str ip, [sp, #0x4]
    bl func_02093e38
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_d6c:
    mov r1, r4
    bl Copy32
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a6340
_LIT1: .word data_0210249c
