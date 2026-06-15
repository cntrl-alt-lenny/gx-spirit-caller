; func_0208fe58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_0210249c
        .extern func_02094030
        .global func_0208fe58
        .arm
func_0208fe58:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    mov r4, r0
    ldr r0, [r3]
    mvn ip, #0x0
    mov lr, r1
    mov r3, r2
    cmp r0, ip
    beq .L_b0c
    cmp r3, #0x30
    bls .L_b0c
    mov r1, r4
    add r2, lr, #0x7000000
    bl func_02094030
    ldmia sp!, {r4, lr}
    bx lr
.L_b0c:
    mov r0, r4
    mov r2, r3
    add r1, lr, #0x7000000
    bl Copy32
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0210249c
