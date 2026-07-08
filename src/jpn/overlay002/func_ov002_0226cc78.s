; func_ov002_0226cc78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae510
        .extern func_ov002_021c8860
        .extern func_ov002_02281c68
        .global func_ov002_0226cc78
        .arm
func_ov002_0226cc78:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    str r0, [sp]
    ldr r0, [r2, #0xd9c]
    str r1, [sp, #0x4]
    cmp r0, #0x0
    bne .L_4d4
    ldr r1, _LIT1
    ldr r0, [sp, #0x4]
    mvn r6, #0x0
    cmp r0, r1
    bne .L_480
    mov r6, #0x0
    ldr r5, _LIT2
    ldr fp, _LIT3
    mov r7, r6
    mov r4, #0x1
.L_428:
    and r0, r7, #0x1
    mla sl, r0, fp, r5
    mov r8, #0x0
    add r9, sl, #0x30
.L_438:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [sl, #0x38]
    cmpne r0, #0x0
    beq .L_460
    mov r0, r7
    mov r1, r8
    bl func_ov002_021c8860
    orr r6, r6, r4, lsl r0
.L_460:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r9, r9, #0x14
    add sl, sl, #0x14
    ble .L_438
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_428
.L_480:
    ldr r1, _LIT4
    ldr r0, [sp]
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    bne .L_4ac
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    bl func_ov002_02281c68
    ldr r1, _LIT0
    str r0, [r1, #0xd44]
    b .L_4b8
.L_4ac:
    mov r1, r6
    mov r0, #0xf1
    bl func_ov002_021ae510
.L_4b8:
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0xd9c]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4d4:
    ldr r2, [r2, #0xd44]
    ldr r1, _LIT5
    mov r0, #0x1
    strh r2, [r1, #0xb0]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x0000161c
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cd664
_LIT5: .word data_ov002_022d0d8c
