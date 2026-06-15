; func_0207b888 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a088c
        .extern func_0207a1dc
        .extern func_0207b038
        .extern func_0209f698
        .global func_0207b888
        .arm
func_0207b888:
    stmdb sp!, {r4, lr}
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_288
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, lr}
    bx lr
.L_288:
    add r1, r1, #0x2000
    ldr r2, [r1, #0x260]
    cmp r2, #0x3
    beq .L_2b8
    cmp r2, #0x9
    beq .L_2d8
    cmp r2, #0xa
    bne .L_2c8
    bl OS_RestoreIrq
    mov r0, #0x2
    ldmia sp!, {r4, lr}
    bx lr
.L_2b8:
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
.L_2c8:
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, lr}
    bx lr
.L_2d8:
    ldrb r0, [r1, #0x26b]
    cmp r0, #0x1
    bne .L_304
    mov r0, #0xa
    bl func_0207b038
    ldr r0, _LIT0
    mov r1, #0x6
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
    b .L_378
.L_304:
    ldr r0, _LIT1
    bl func_0209f698
    cmp r0, #0x2
    beq .L_328
    cmp r0, #0x3
    beq .L_35c
    cmp r0, #0x8
    beq .L_348
    b .L_35c
.L_328:
    mov r0, #0xa
    bl func_0207b038
    ldr r0, _LIT0
    mov r1, #0x6
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
    b .L_378
.L_348:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x4
    ldmia sp!, {r4, lr}
    bx lr
.L_35c:
    mov r0, #0xb
    bl func_0207b038
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x7
    ldmia sp!, {r4, lr}
    bx lr
.L_378:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x3
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word func_0207a1dc
