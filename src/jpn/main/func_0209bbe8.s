; func_0209bbe8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8354
        .extern data_021a8358
        .extern func_02096134
        .extern func_02096318
        .extern func_02096340
        .extern func_0209b4ec
        .global func_0209bbe8
        .arm
func_0209bbe8:
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
    str r2, [r0, #0x1c]
    str r2, [r0, #0x8]
    str r2, [r0, #0xc]
    bl func_02096134
    mov r5, #0x5
    mov r4, #0x1
.L_50:
    mov r0, r5
    mov r1, r4
    bl func_02096318
    cmp r0, #0x0
    beq .L_50
    ldr r1, _LIT2
    mov r0, #0x5
    bl func_02096340
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a8354
_LIT1: .word data_021a8358
_LIT2: .word func_0209b4ec
