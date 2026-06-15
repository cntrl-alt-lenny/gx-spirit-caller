; func_0208ffec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210249c
        .extern func_02093fb8
        .extern func_020944a4
        .global func_0208ffec
        .arm
func_0208ffec:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    mov r4, r0
    ldr r0, [r3]
    mvn ip, #0x0
    mov lr, r1
    mov r3, r2
    cmp r0, ip
    beq .L_ca0
    cmp r3, #0x1c
    bls .L_ca0
    mov r1, r4
    add r2, lr, #0x5000000
    bl func_02093fb8
    ldmia sp!, {r4, lr}
    bx lr
.L_ca0:
    mov r0, r4
    mov r2, r3
    add r1, lr, #0x5000000
    bl func_020944a4
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0210249c
