; func_020a6350 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9864
        .extern data_021a9868
        .extern data_021a986c
        .extern data_021a9940
        .extern func_02096134
        .extern func_02096318
        .extern func_02096340
        .extern func_020a5cbc
        .extern func_020a6008
        .extern func_020a6048
        .extern func_020a607c
        .extern func_020a60fc
        .extern func_020a6138
        .extern func_020a6520
        .global func_020a6350
        .arm
func_020a6350:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    mov r1, #0x1
    str r1, [r0]
    bl func_020a6008
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0]
    bl func_02096134
    mov r5, #0xd
    mov r4, #0x1
.L_25c:
    mov r0, r5
    mov r1, r4
    bl func_02096318
    cmp r0, #0x0
    beq .L_25c
    ldr r1, _LIT2
    mov r0, #0xd
    bl func_02096340
    bl func_020a6138
    mov r0, #0xd
    mov r1, #0x0
    bl func_02096340
    ldr r1, _LIT3
    mov r0, #0xd
    bl func_02096340
    ldr r1, _LIT4
    mov r2, #0x0
    ldr r0, _LIT5
    str r2, [r1]
    bl func_020a6520
    ldr r1, _LIT6
    mov r0, #0x11
    bl func_02096340
    mov r0, #0x0
    bl func_020a5cbc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a9864
_LIT1: .word data_021a9868
_LIT2: .word func_020a60fc
_LIT3: .word func_020a607c
_LIT4: .word data_021a986c
_LIT5: .word data_021a9940
_LIT6: .word func_020a6048
