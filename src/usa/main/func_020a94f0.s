; func_020a94f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102624
        .extern data_021a62f0
        .extern data_021a9f60
        .extern data_021a9f84
        .extern data_021a9ff0
        .extern func_020925a4
        .extern func_02092660
        .extern func_020926d0
        .extern func_020a8c5c
        .extern func_020a9480
        .extern func_020acd20
        .global func_020a94f0
        .arm
func_020a94f0:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    mvn r1, #0x0
    bl func_020acd20
    cmp r0, #0x0
    mvnge r0, #0x0
    ldmgeia sp!, {r4, lr}
    addge sp, sp, #0x10
    bxge lr
    ldr r0, _LIT1
    bl func_020925a4
    cmp r0, #0x0
    bne .L_5c
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldr r2, [r0, #0x4]
    ldr r0, _LIT4
    ldr r3, [r2, #0x6c]
    mov r2, #0x1
    str r3, [r1, #0xc]
    str r2, [r0, #0xc]
    b .L_b4
.L_5c:
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldr r0, [r0, #0x4]
    ldr r1, [r1, #0xc]
    ldr r0, [r0, #0x6c]
    cmp r1, r0
    bne .L_8c
    ldr r0, _LIT4
    ldr r1, [r0, #0xc]
    add r1, r1, #0x1
    str r1, [r0, #0xc]
    b .L_b4
.L_8c:
    ldr r0, _LIT1
    bl func_020926d0
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldr r2, [r0, #0x4]
    ldr r0, _LIT4
    ldr r3, [r2, #0x6c]
    mov r2, #0x1
    str r3, [r1, #0xc]
    str r2, [r0, #0xc]
.L_b4:
    add r0, sp, #0x8
    bic r3, r0, #0x3
    ldr r2, [sp, #0x8]
    ldr r0, _LIT5
    ldr r1, _LIT0
    add r3, r3, #0x4
    bl func_020a8c5c
    ldr r1, _LIT4
    mov r4, r0
    ldr r0, [r1, #0xc]
    subs r0, r0, #0x1
    str r0, [r1, #0xc]
    bne .L_f0
    ldr r0, _LIT1
    bl func_02092660
.L_f0:
    mov r0, r4
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word data_02102624+0x60
_LIT1: .word data_021a9ff0
_LIT2: .word data_021a62f0
_LIT3: .word data_021a9f60
_LIT4: .word data_021a9f84
_LIT5: .word func_020a9480
