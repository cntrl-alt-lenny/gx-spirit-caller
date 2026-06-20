; func_ov002_02286110 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022ce288
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a8
        .extern func_0202b878
        .extern func_0202b890
        .extern func_0202b8a8
        .extern func_0202b8f0
        .extern func_0202b920
        .extern func_ov002_021c4c9c
        .extern func_ov002_021c84a8
        .extern func_ov002_02285984
        .extern func_ov002_022859b4
        .extern func_ov002_02285a9c
        .global func_ov002_02286110
        .arm
func_ov002_02286110:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xcc
    mov r7, r0
    mov r6, r1
    add r0, sp, #0x4
    mov r8, r2
    mov r1, r7
    mov r4, r3
    ldr r5, [sp, #0xe8]
    bl func_ov002_02285984
    mov r0, r7
    mov r1, r6
    mov r3, r8
    mov r2, #0x0
    str r4, [sp]
    bl func_ov002_02285a9c
    movs r4, r0
    bmi .L_430
    ldr r1, _LIT0
    ldrh r0, [r1, #0x4]
    tst r0, #0x1
    beq .L_3ec
    ldr r0, _LIT1
    cmp r6, r0
    beq .L_368
    add r0, r0, #0x47
    cmp r6, r0
    beq .L_394
    ldr r0, _LIT2
    cmp r6, r0
    beq .L_3c8
    b .L_3ec
.L_368:
    ldrh ip, [r1, #0x10]
    ldr r1, _LIT3
    mov r0, #0x2bc
    mov r2, #0x14
    ldr r3, _LIT4
    and r6, r7, #0x1
    mul lr, ip, r0
    mul r2, r4, r2
    mla r0, r6, r1, r3
    str lr, [r2, r0]
    b .L_3ec
.L_394:
    ldr r1, _LIT5
    ldr r0, _LIT6
    ldr r6, [r1, #0x6a8]
    mov r1, #0x14
    cmp r6, r0
    movgt r6, r0
    ldr r0, _LIT3
    ldr r2, _LIT4
    and r3, r7, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    str r6, [r1, r0]
    b .L_3ec
.L_3c8:
    ldr r0, _LIT3
    mov r1, #0x14
    ldr r3, _LIT4
    and r6, r7, #0x1
    ldr r2, _LIT5
    mul r1, r4, r1
    mla r0, r6, r0, r3
    ldr r2, [r2, #0x6a4]
    str r2, [r1, r0]
.L_3ec:
    mov r0, r7
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c4c9c
    mov r1, #0x14
    ldr r0, _LIT3
    ldr r2, _LIT7
    and r6, r7, #0x1
    mul r3, r4, r1
    mla r2, r6, r0, r2
    mov r6, #0x1
    mov r0, r7
    mov r1, r4
    strh r6, [r3, r2]
    bl func_ov002_021c84a8
    str r0, [r5, #0x18]
    b .L_470
.L_430:
    mov r0, r6
    str r6, [r5]
    bl func_0202b890
    str r0, [r5, #0x8]
    mov r0, r6
    bl func_0202b8a8
    str r0, [r5, #0x10]
    mov r0, r6
    bl func_0202b878
    str r0, [r5, #0x4]
    mov r0, r6
    bl func_0202b8f0
    str r0, [r5, #0x14]
    mov r0, r6
    bl func_0202b920
    str r0, [r5, #0x18]
.L_470:
    add r0, sp, #0x4
    mov r1, r7
    bl func_ov002_022859b4
    add sp, sp, #0xcc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word 0x000018b4
_LIT2: .word 0x00001a4e
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf1a8
_LIT5: .word data_ov002_022ce288
_LIT6: .word 0x0000ffff
_LIT7: .word data_ov002_022cf1a2
