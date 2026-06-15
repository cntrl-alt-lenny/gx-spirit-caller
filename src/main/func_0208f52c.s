; func_0208f52c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_0210249c
        .extern data_021a632c
        .extern data_021a6330
        .extern func_02093e38
        .global func_0208f52c
        .arm
func_0208f52c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    ldr lr, _LIT0
    ldr ip, _LIT1
    ldr r3, _LIT2
    ldr lr, [lr]
    ldr r4, [ip]
    add r5, lr, r1
    ldr lr, [r3]
    mvn ip, #0x0
    mov r1, r0
    mov r3, r2
    cmp lr, ip
    sub r4, r5, r4
    beq .L_200
    mov ip, #0x0
    str ip, [sp]
    mov r0, lr
    mov r2, r4
    str ip, [sp, #0x4]
    bl func_02093e38
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_200:
    mov r1, r4
    bl Copy32
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a6330
_LIT1: .word data_021a632c
_LIT2: .word data_0210249c
