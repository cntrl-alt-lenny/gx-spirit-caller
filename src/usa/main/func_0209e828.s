; func_0209e828 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020927e4
        .extern func_0209da94
        .extern func_0209dbb4
        .extern func_0209dc3c
        .extern func_0209dd68
        .global func_0209e828
        .arm
func_0209e828:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    mov r5, r1
    bl func_0209dbb4
    mov r1, #0xa
    mov r4, r0
    str r1, [sp]
    mov ip, #0xb
    mov r0, #0x5
    mov r1, #0x7
    mov r2, #0x9
    mov r3, #0x8
    str ip, [sp, #0x4]
    bl func_0209da94
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    ldr r2, [r4, #0x4]
    ldrh r0, [r2]
    cmp r0, #0x7
    beq .L_64
    cmp r0, #0x9
    bne .L_c0
.L_64:
    cmp r5, #0x1
    bcc .L_74
    cmp r5, #0xf
    bls .L_84
.L_74:
    add sp, sp, #0x8
    mov r0, #0x6
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_84:
    ldr r0, _LIT0
    mov r1, #0x2
    add r0, r2, r0
    bl func_020927e4
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    add r0, r0, #0x100
    ldrh r2, [r0, #0x82]
    mov r0, r1, lsl r5
    ands r0, r2, r0
    bne .L_d4
    add sp, sp, #0x8
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_c0:
    cmp r5, #0x0
    addne sp, sp, #0x8
    movne r0, #0x6
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
.L_d4:
    mov r1, r6
    mov r0, #0xd
    bl func_0209dd68
    mov r1, #0x1
    mov r2, r1, lsl r5
    mov r0, #0xd
    bl func_0209dc3c
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x00000182
