; func_0208f128 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_021023bc
        .extern func_02093d44
        .global func_0208f128
        .arm
func_0208f128:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    ldr r3, _LIT0
    mvn ip, #0x0
    ldr lr, [r3]
    mov r5, r0
    mov r4, r1
    mov r3, r2
    cmp lr, ip
    beq .L_54
    ldr r2, _LIT1
    mov ip, #0x0
    str ip, [sp]
    mov r0, lr
    mov r1, r5
    add r2, r4, r2
    str ip, [sp, #0x4]
    bl func_02093d44
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_54:
    ldr r1, _LIT1
    add r1, r4, r1
    bl Copy32
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021023bc
_LIT1: .word 0x068a0000
