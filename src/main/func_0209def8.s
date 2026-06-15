; func_0209def8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a8d28
        .extern data_021a8d2c
        .extern data_021a8d30
        .extern data_021a8d50
        .extern data_021a8dc0
        .extern func_0209256c
        .extern func_02092614
        .extern func_020928cc
        .extern func_020928e8
        .extern func_020940ac
        .extern func_02096228
        .extern func_0209640c
        .extern func_02096434
        .extern func_0209d788
        .extern func_0209d7a4
        .global func_0209def8
        .arm
func_0209def8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r6, r0
    mov r5, r1
    mov r7, r2
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldrh r1, [r1]
    cmp r1, #0x0
    beq .L_38
    bl OS_RestoreIrq
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
.L_38:
    cmp r6, #0x0
    bne .L_50
    bl OS_RestoreIrq
    mov r0, #0x6
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
.L_50:
    cmp r5, #0x3
    bls .L_68
    bl OS_RestoreIrq
    mov r0, #0x6
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
.L_68:
    ands r1, r6, #0x1f
    beq .L_80
    bl OS_RestoreIrq
    mov r0, #0x6
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
.L_80:
    bl func_02096228
    mov r0, #0xa
    mov r1, #0x1
    bl func_0209640c
    cmp r0, #0x0
    bne .L_ac
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
.L_ac:
    mov r0, r6
    mov r1, r7
    bl func_020928cc
    mov r0, r5
    mov r1, r6
    mov r3, r7
    mov r2, #0x0
    bl func_020940ac
    ldr r0, _LIT1
    add r1, r6, #0x200
    str r6, [r0]
    str r1, [r6]
    ldr r2, [r0]
    ldr r1, [r2]
    add r1, r1, #0x300
    str r1, [r2, #0x4]
    ldr r2, [r0]
    ldr r1, [r2, #0x4]
    add r1, r1, #0x800
    str r1, [r2, #0xc]
    ldr r1, [r0]
    ldr r0, [r1, #0xc]
    add r0, r0, #0x100
    str r0, [r1, #0x10]
    bl func_0209d788
    ldr r1, _LIT1
    mov r3, #0x0
    ldr r0, [r1]
    strh r5, [r0, #0x14]
    ldr r0, [r1]
    str r3, [r0, #0x14c]
    ldr r0, [r1]
    add r0, r0, #0x100
    strh r3, [r0, #0x50]
    mov r2, r3
.L_138:
    ldr r0, [r1]
    add r0, r0, r3, lsl #0x2
    str r2, [r0, #0xcc]
    ldr r0, [r1]
    add r0, r0, r3, lsl #0x2
    add r3, r3, #0x1
    str r2, [r0, #0x10c]
    cmp r3, #0x10
    blt .L_138
    ldr r0, _LIT2
    ldr r1, _LIT3
    mov r2, #0xa
    bl func_02092614
    ldr r9, _LIT4
    mov sl, #0x0
    ldr r6, _LIT2
    mov r8, #0x8000
    mov r7, #0x2
    mov r5, #0x1
.L_184:
    mov r0, r9
    mov r1, r7
    strh r8, [r9]
    bl func_020928e8
    mov r0, r6
    mov r1, r9
    mov r2, r5
    bl func_0209256c
    add sl, sl, #0x1
    cmp sl, #0xa
    add r9, r9, #0x100
    blt .L_184
    ldr r1, _LIT5
    mov r0, #0xa
    bl func_02096434
    ldr r1, _LIT0
    mov r2, #0x1
    mov r0, r4
    strh r2, [r1]
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word data_021a8d28
_LIT1: .word data_021a8d2c
_LIT2: .word data_021a8d30
_LIT3: .word data_021a8d50
_LIT4: .word data_021a8dc0
_LIT5: .word func_0209d7a4
