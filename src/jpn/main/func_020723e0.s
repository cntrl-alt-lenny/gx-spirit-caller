; func_020723e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62f0
        .extern func_0207245c
        .global func_020723e0
        .arm
func_020723e0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r7, r0
    ldr r4, [r2, #0x8]
    mov r6, r1
    cmp r4, #0x0
    beq .L_ec
.L_a4:
    ldr r5, [r4, #0xa4]
    cmp r5, #0x0
    beq .L_e0
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_e0
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_0207245c
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, r5
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
.L_e0:
    ldr r4, [r4, #0x68]
    cmp r4, #0x0
    bne .L_a4
.L_ec:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a62f0
