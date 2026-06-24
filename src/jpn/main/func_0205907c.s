; func_0205907c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100284
        .extern data_02100398
        .extern data_02100434
        .extern data_02100440
        .extern data_02100448
        .extern data_02100450
        .extern data_02100460
        .extern data_0210046c
        .extern data_02100478
        .extern data_02100488
        .extern data_02100494
        .extern data_0219e354
        .extern func_02054880
        .extern func_02054a5c
        .extern func_02054a8c
        .extern func_02057fc4
        .extern func_02057ffc
        .extern func_020aace8
        .global func_0205907c
        .arm
func_0205907c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xec
    mov fp, r0
    ldr r4, [fp]
    ldr r0, _LIT0
    mov r5, r1
    add r0, r4, r0
    bl func_020aace8
    mov r9, r0
    ldr r0, _LIT1
    bl func_02054a8c
    cmp r9, #0x0
    mov sl, #0x0
    bls .L_75c
    add r8, sp, #0x0
    mov r7, sl
    mov r6, #0xff
.L_72c:
    mov r0, r7
    mov r1, r6
    bl func_02054a5c
    add r1, r4, sl
    add r1, r1, #0x100
    add sl, sl, #0x1
    ldrsb r1, [r1, #0x77]
    mov r0, r0, lsl #0x18
    cmp sl, r9
    eor r0, r1, r0, asr #0x18
    strb r0, [r8], #0x1
    bcc .L_72c
.L_75c:
    add r0, sp, #0x0
    mov r6, #0x0
    add r1, sp, #0x1f
    mov r2, r9
    mov r3, #0x1
    strb r6, [r0, sl]
    bl func_02054880
    ldr r2, _LIT2
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, _LIT3
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, fp
    add r1, r4, #0x1f4
    add r2, r4, #0x144
    bl func_02057ffc
    ldr r2, _LIT4
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, fp
    add r1, r4, #0x1f4
    add r2, r4, #0x110
    bl func_02057ffc
    ldr r2, _LIT5
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, fp
    add r1, r4, #0x1f4
    add r2, sp, #0x1f
    bl func_02057ffc
    ldr r2, _LIT6
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, [r4, #0x46c]
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057fc4
    ldr r2, _LIT7
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, _LIT8
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, _LIT9
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, [r4, #0x470]
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057fc4
    ldr r2, _LIT10
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, _LIT11
    mov r0, fp
    add r1, r4, #0x1f4
    add r2, r4, r2
    bl func_02057ffc
    add r0, r5, #0x200
    ldrsb r0, [r0, #0xc2]
    cmp r0, #0x0
    beq .L_918
    ldr r0, _LIT12
    add r0, r5, r0
    bl func_020aace8
    mov sl, r0
    ldr r0, _LIT1
    bl func_02054a8c
    cmp sl, #0x0
    mov r8, r6
    bls .L_8dc
    add r9, sp, #0x4c
    mov r7, r8
    mov r6, #0xff
.L_8ac:
    mov r0, r7
    mov r1, r6
    bl func_02054a5c
    add r1, r5, r8
    add r1, r1, #0x200
    add r8, r8, #0x1
    ldrsb r1, [r1, #0xc2]
    mov r0, r0, lsl #0x18
    cmp r8, sl
    eor r0, r1, r0, asr #0x18
    strb r0, [r9], #0x1
    bcc .L_8ac
.L_8dc:
    add r0, sp, #0x4c
    mov r5, #0x0
    add r1, sp, #0x8d
    mov r2, sl
    mov r3, #0x1
    strb r5, [r0, r8]
    bl func_02054880
    ldr r2, _LIT13
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057ffc
    add r2, sp, #0x8d
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057ffc
.L_918:
    ldr r2, _LIT14
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, _LIT15
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, #0x0
    add sp, sp, #0xec
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000177
_LIT1: .word 0x79707367
_LIT2: .word data_02100434
_LIT3: .word data_02100440
_LIT4: .word data_02100448
_LIT5: .word data_02100450
_LIT6: .word data_02100460
_LIT7: .word data_0210046c
_LIT8: .word data_0219e354
_LIT9: .word data_02100478
_LIT10: .word data_02100398
_LIT11: .word 0x0000012f
_LIT12: .word 0x000002c2
_LIT13: .word data_02100488
_LIT14: .word data_02100494
_LIT15: .word data_02100284
