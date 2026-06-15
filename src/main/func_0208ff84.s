; func_0208ff84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210249c
        .extern func_02093fb8
        .extern func_020944a4
        .global func_0208ff84
        .arm
func_0208ff84:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    mov r4, r0
    ldr r0, [r3]
    mvn ip, #0x0
    mov lr, r1
    mov r3, r2
    cmp r0, ip
    beq .L_c3c
    cmp r3, #0x1c
    bls .L_c3c
    ldr r2, _LIT1
    mov r1, r4
    add r2, lr, r2
    bl func_02093fb8
    ldmia sp!, {r4, lr}
    bx lr
.L_c3c:
    ldr r1, _LIT1
    mov r0, r4
    mov r2, r3
    add r1, lr, r1
    bl func_020944a4
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0210249c
_LIT1: .word 0x05000400
