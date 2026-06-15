; func_0209b384 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a83cc
        .extern data_021a83dc
        .extern data_021a83e4
        .extern data_021a83f4
        .extern data_021a840c
        .extern func_02092844
        .extern func_02096228
        .extern func_0209640c
        .extern func_02096434
        .extern func_0209b298
        .global func_0209b384
        .arm
func_0209b384:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldrh r0, [r1]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    ldr r0, _LIT1
    mov r2, #0x0
    mov r3, #0x1
    strh r3, [r1]
    str r2, [r0]
    str r2, [r0, #0x4]
    bl func_02096228
    mov r5, #0x8
    mov r4, #0x1
.L_2d4:
    mov r0, r5
    mov r1, r4
    bl func_0209640c
    cmp r0, #0x0
    beq .L_2d4
    ldr r1, _LIT2
    mov r0, #0x8
    bl func_02096434
    mov r3, #0x0
    ldr r0, _LIT3
    mov r2, r3
.L_300:
    mov r1, r3, lsl #0x3
    add r3, r3, #0x1
    strh r2, [r0, r1]
    cmp r3, #0x5
    blt .L_300
    ldr r0, _LIT4
    bl func_02092844
    ldr r1, _LIT5
    ldr r0, _LIT6
    ldr r1, [r1]
    str r1, [r0]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a83cc
_LIT1: .word data_021a83e4
_LIT2: .word func_0209b298
_LIT3: .word data_021a840c
_LIT4: .word data_021a83f4
_LIT5: .word 0x027ffc3c
_LIT6: .word data_021a83dc
