; func_02058954 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100370
        .extern data_02100398
        .extern data_021003b0
        .extern func_020585d4
        .extern func_0205ffd4
        .extern func_020601d0
        .extern func_020a6d54
        .global func_02058954
        .arm
func_02058954:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r4, [r5]
    add r2, sp, #0x0
    ldr r1, [r4, #0x1d4]
    bl func_020601d0
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    ldr r0, [sp]
    cmp r0, #0x4
    bne .L_914
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r5
    bl func_0205ffd4
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x4
    mov r0, #0x4
    ldmia sp!, {r4, r5, pc}
.L_914:
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    cmp r0, #0x3
    beq .L_940
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldr r3, _LIT4
    mov r2, #0x0
    bl func_020a6d54
.L_940:
    mov r0, #0x2
    str r0, [r4, #0x1d8]
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x00000107
_LIT1: .word data_02100370
_LIT2: .word data_02100398
_LIT3: .word data_021003b0
_LIT4: .word 0x000002ef
