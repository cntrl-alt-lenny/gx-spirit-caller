; func_02091ea0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62dc
        .extern data_021a62e4
        .extern data_021a62e8
        .extern data_021a62f0
        .extern func_020918c4
        .extern func_020921f0
        .extern func_0209223c
        .extern func_02093714
        .global func_02091ea0
        .arm
func_02091ea0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    ldr r4, _LIT1
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    bne .L_298
    bl func_02093714
    cmp r0, #0x12
    bne .L_2a8
.L_298:
    mov r0, #0x1
    strh r0, [r4]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_2a8:
    ldr r0, _LIT2
    ldr r0, [r0]
    ldr r6, [r0]
    bl func_020918c4
    mov r5, r0
    cmp r6, r5
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    cmp r5, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r0, [r6, #0x64]
    cmp r0, #0x2
    beq .L_2f4
    mov r0, r6
    bl func_020921f0
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
.L_2f4:
    ldr r0, _LIT3
    ldr r2, [r0]
    cmp r2, #0x0
    beq .L_310
    mov r0, r6
    mov r1, r5
    blx r2
.L_310:
    ldr r2, [r4, #0xc]
    cmp r2, #0x0
    beq .L_328
    mov r0, r6
    mov r1, r5
    blx r2
.L_328:
    ldr r1, _LIT1
    mov r0, r5
    str r5, [r1, #0x4]
    bl func_0209223c
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a62dc
_LIT1: .word data_021a62f0
_LIT2: .word data_021a62e8
_LIT3: .word data_021a62e4
