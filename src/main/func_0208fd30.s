; func_0208fd30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_0210249c
        .extern func_02094030
        .global func_0208fd30
        .arm
func_0208fd30:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    mov r4, r0
    ldr r0, [r3]
    mvn ip, #0x0
    mov lr, r1
    mov r3, r2
    cmp r0, ip
    mov ip, #0x6600000
    beq .L_9e8
    cmp r3, #0x30
    bls .L_9e8
    mov r1, r4
    add r2, ip, lr
    bl func_02094030
    ldmia sp!, {r4, lr}
    bx lr
.L_9e8:
    mov r0, r4
    mov r2, r3
    add r1, ip, lr
    bl Copy32
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0210249c
