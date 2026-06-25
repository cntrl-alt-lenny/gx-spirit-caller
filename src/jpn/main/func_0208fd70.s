; func_0208fd70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_021023bc
        .extern func_02093f3c
        .global func_0208fd70
        .arm
func_0208fd70:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    mov r4, r0
    ldr r0, [r3]
    mvn ip, #0x0
    mov lr, r1
    mov r3, r2
    cmp r0, ip
    beq .L_ab4
    cmp r3, #0x30
    bls .L_ab4
    mov r1, r4
    add r2, lr, #0x7000000
    bl func_02093f3c
    ldmia sp!, {r4, lr}
    bx lr
.L_ab4:
    mov r0, r4
    mov r2, r3
    add r1, lr, #0x7000000
    bl Copy32
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021023bc
