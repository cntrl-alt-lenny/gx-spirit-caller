; func_02093c90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02093bfc
        .global func_02093c90
        .arm
func_02093c90:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    mov r7, r0
    mov r6, r1
    mov r5, #0x0
.L_18:
    cmp r5, r7
    beq .L_94
    ldr r1, [r4]
    ands r0, r1, #-2147483648
    beq .L_94
    and r0, r1, #0x38000000
    cmp r0, r6
    beq .L_94
    cmp r0, #0x8000000
    bne .L_48
    cmp r6, #0x10000000
    beq .L_94
.L_48:
    cmp r0, #0x10000000
    bne .L_58
    cmp r6, #0x8000000
    beq .L_94
.L_58:
    cmp r0, #0x18000000
    beq .L_90
    cmp r0, #0x20000000
    beq .L_90
    cmp r0, #0x28000000
    beq .L_90
    cmp r0, #0x30000000
    beq .L_90
    cmp r0, #0x38000000
    beq .L_90
    cmp r0, #0x8000000
    beq .L_90
    cmp r0, #0x10000000
    bne .L_94
.L_90:
    bl func_02093bfc
.L_94:
    add r5, r5, #0x1
    cmp r5, #0x3
    add r4, r4, #0xc
    blt .L_18
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x040000b8
