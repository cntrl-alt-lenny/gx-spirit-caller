; func_020a6444 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9944
        .extern data_021a9948
        .extern data_021a994c
        .extern data_021a9a20
        .extern func_02096228
        .extern func_0209640c
        .extern func_02096434
        .extern func_020a5db0
        .extern func_020a60fc
        .extern func_020a613c
        .extern func_020a6170
        .extern func_020a61f0
        .extern func_020a622c
        .extern func_020a6614
        .global func_020a6444
        .arm
func_020a6444:
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
    bl func_020a60fc
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0]
    bl func_02096228
    mov r5, #0xd
    mov r4, #0x1
.L_318:
    mov r0, r5
    mov r1, r4
    bl func_0209640c
    cmp r0, #0x0
    beq .L_318
    ldr r1, _LIT2
    mov r0, #0xd
    bl func_02096434
    bl func_020a622c
    mov r0, #0xd
    mov r1, #0x0
    bl func_02096434
    ldr r1, _LIT3
    mov r0, #0xd
    bl func_02096434
    ldr r1, _LIT4
    mov r2, #0x0
    ldr r0, _LIT5
    str r2, [r1]
    bl func_020a6614
    ldr r1, _LIT6
    mov r0, #0x11
    bl func_02096434
    mov r0, #0x0
    bl func_020a5db0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a9944
_LIT1: .word data_021a9948
_LIT2: .word func_020a61f0
_LIT3: .word func_020a6170
_LIT4: .word data_021a994c
_LIT5: .word data_021a9a20
_LIT6: .word func_020a613c
