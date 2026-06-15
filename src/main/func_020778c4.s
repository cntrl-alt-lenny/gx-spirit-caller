; func_020778c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020778c4
        .arm
func_020778c4:
    stmdb sp!, {r4, lr}
    ldrb ip, [r0, #0x1]
    ldrb r3, [r0]
    mov r2, #0xa
    cmp r1, #0x17
    mla r1, r3, r2, ip
    sub lr, r1, #0x210
    add r0, r0, #0x2
    bne .L_868
    cmp lr, #0x32
    ldrcs r1, _LIT0
    addcc r4, lr, #0x7d0
    addcs r4, lr, r1
    b .L_884
.L_868:
    ldrb ip, [r0, #0x1]
    ldrb r3, [r0]
    mov r1, #0x64
    add r0, r0, #0x2
    mla r2, r3, r2, ip
    sub r2, r2, #0x210
    mla r4, lr, r1, r2
.L_884:
    ldrb ip, [r0, #0x1]
    ldrb r3, [r0]
    mov r1, #0xa
    ldrb r2, [r0, #0x3]
    ldrb r0, [r0, #0x2]
    mla ip, r3, r1, ip
    mla r1, r0, r1, r2
    mov r2, r4, lsl #0x10
    sub r0, ip, #0x210
    add r2, r2, r0, lsl #0x8
    sub r0, r1, #0x210
    add r0, r2, r0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x0000076c
