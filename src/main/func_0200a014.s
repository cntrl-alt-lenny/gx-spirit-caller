; func_0200a014 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_02106810
        .extern data_0210693c
        .extern data_021069f4
        .extern func_02009758
        .extern func_020097a4
        .extern func_02019034
        .global func_0200a014
        .arm
func_0200a014:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r2, _LIT0
    mov sl, r0
    ldrh r3, [r2, #0xb6]
    ldr r4, _LIT1
    mov r0, #0x6
    mla r7, r3, r0, r4
    ldr r2, _LIT2
    mov r8, sl, asr #0x5
    ldr r0, [r2, r8, lsl #0x2]
    ldr r6, _LIT3
    and r4, sl, #0x1f
    mov r5, #0x1
    mov r9, r1
    tst r0, r5, lsl r4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r1, [r7]
    mov r0, sl, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    strh r0, [r7]
    bl func_02019034
    strh r0, [r7, #0x2]
    ldrh r0, [r7]
    cmp sl, #0x79
    bic r0, r0, #0xff00
    strh r0, [r7]
    ldrh r0, [r7, #0x4]
    bic r0, r0, #0x1
    beq .L_8c4
    orr r0, r0, #0x1
    strh r0, [r7, #0x4]
    ldrh r0, [r7, #0x4]
    bic r0, r0, #0x2
    strh r0, [r7, #0x4]
    ldrh r0, [r7, #0x4]
    bic r0, r0, #0x4
    b .L_8d0
.L_8c4:
    strh r0, [r7, #0x4]
    ldrh r0, [r7, #0x4]
    orr r0, r0, #0x6
.L_8d0:
    strh r0, [r7, #0x4]
    ldrh r1, [r7, #0x4]
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3f8
    mov r0, r0, lsl #0x19
    orr r0, r1, r0, lsr #0x16
    strh r0, [r7, #0x4]
    add r0, r6, #0x1a00
    ldrh r1, [r0, #0xa4]
    add r3, r6, #0x1a00
    ldr r2, _LIT4
    cmp r1, #0x50
    addcc r1, r1, #0x1
    strcch r1, [r0, #0xa4]
    ldrh r0, [r3, #0xa6]
    add r7, r6, #0x2a8
    add r9, r0, #0x1
    smull r1, sl, r2, r9
    mov r0, r9, lsr #0x1f
    add sl, r0, sl, asr #0x5
    mov r2, #0x50
    smull r0, r1, r2, sl
    sub sl, r9, r0
    strh sl, [r3, #0xa6]
    add r3, r7, #0x1800
    mvn r1, r5, lsl r4
    ldr r2, [r3, r8, lsl #0x2]
    mov r0, #0xa
    and r1, r2, r1
    str r1, [r3, r8, lsl #0x2]
    bl func_020097a4
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r2, #0x1
    mov r1, #0x0
.L_960:
    add r0, r6, r1, lsl #0x2
    add r0, r0, #0x1000
    ldr r0, [r0, #0xaa8]
    cmp r0, #0x0
    movne r2, #0x0
    bne .L_984
    add r1, r1, #0x1
    cmp r1, #0x4
    blt .L_960
.L_984:
    cmp r2, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, #0xa
    bl func_02009758
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0210693c
_LIT1: .word data_02106810
_LIT2: .word data_021069f4
_LIT3: .word data_02104f4c
_LIT4: .word 0x66666667
