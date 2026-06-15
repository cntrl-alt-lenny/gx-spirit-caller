; func_020a6ba0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a63d0
        .extern data_021a9f30
        .extern data_021a9f40
        .extern data_021aa040
        .extern data_021aa064
        .extern data_021aa088
        .extern func_0209268c
        .extern func_02092748
        .extern func_020927b8
        .extern func_020a70fc
        .extern func_020b4314
        .global func_020a6ba0
        .arm
func_020a6ba0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    bl func_0209268c
    cmp r0, #0x0
    bne .L_38
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, [r0, #0x4]
    ldr r0, _LIT3
    ldr r3, [r2, #0x6c]
    mov r2, #0x1
    str r3, [r1]
    str r2, [r0]
    b .L_90
.L_38:
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0, #0x4]
    ldr r1, [r1]
    ldr r0, [r0, #0x6c]
    cmp r1, r0
    bne .L_68
    ldr r0, _LIT3
    ldr r1, [r0]
    add r1, r1, #0x1
    str r1, [r0]
    b .L_90
.L_68:
    ldr r0, _LIT0
    bl func_020927b8
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, [r0, #0x4]
    ldr r0, _LIT3
    ldr r3, [r2, #0x6c]
    mov r2, #0x1
    str r3, [r1]
    str r2, [r0]
.L_90:
    ldr r4, _LIT4
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    ble .L_c4
    ldr r5, _LIT5
.L_a4:
    ldr r0, [r4, #0x8]
    sub r1, r0, #0x1
    ldr r0, [r5, r1, lsl #0x2]
    str r1, [r4, #0x8]
    blx r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    bgt .L_a4
.L_c4:
    ldr r0, _LIT3
    ldr r1, [r0]
    subs r1, r1, #0x1
    str r1, [r0]
    bne .L_e0
    ldr r0, _LIT0
    bl func_02092748
.L_e0:
    ldr r0, _LIT4
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_100
    blx r0
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0]
.L_100:
    mov r0, #0x0
    bl func_020a70fc
    bl func_020b4314
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_021aa088
_LIT1: .word data_021a63d0
_LIT2: .word data_021aa040
_LIT3: .word data_021aa064
_LIT4: .word data_021a9f30
_LIT5: .word data_021a9f40
