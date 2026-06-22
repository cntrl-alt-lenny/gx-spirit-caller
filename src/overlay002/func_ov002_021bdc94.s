; func_ov002_021bdc94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_0202e42c
        .extern func_02031838
        .extern func_ov002_021bb90c
        .extern func_ov002_021bc000
        .extern func_ov002_021bd948
        .extern func_ov002_021c9fc4
        .global func_ov002_021bdc94
        .arm
func_ov002_021bdc94:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r3, _LIT0
    and r4, r6, #0x1
    mul r5, r4, r3
    mov r2, #0x14
    mul r4, r1, r2
    ldr r3, _LIT1
    add r2, r3, r5
    ldrh r2, [r4, r2]
    cmp r2, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    bl func_ov002_021bd948
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    bl func_ov002_021c9fc4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT2
    ldr r2, _LIT3
    add r0, r0, r5
    add r0, r0, r4
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    cmp r2, r0, lsr #0x13
    mov r1, r0, lsr #0x13
    bcc .L_3e0
    cmp r1, r2
    bcs .L_424
    sub r0, r2, #0x84
    cmp r1, r0
    beq .L_424
    b .L_478
.L_3e0:
    add r0, r2, #0x40
    cmp r1, r0
    bhi .L_414
    add r0, r2, #0x3b
    subs r0, r1, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_478
    b .L_43c
    b .L_43c
    b .L_43c
    b .L_43c
    b .L_43c
    b .L_43c
.L_414:
    ldr r0, _LIT4
    cmp r1, r0
    beq .L_460
    b .L_478
.L_424:
    mov r0, r6
    bl func_ov002_021bb90c
    cmp r0, #0x0
    beq .L_478
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_43c:
    mov r0, r1
    bl func_02031838
    mov r1, r0
    mov r0, r6
    bl func_ov002_021bb90c
    cmp r0, #0x0
    bne .L_478
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_460:
    ldr r1, _LIT5
    mov r0, r6
    bl func_ov002_021bc000
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_478:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a4
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x0000160f
_LIT4: .word 0x00001691
_LIT5: .word func_0202e42c
