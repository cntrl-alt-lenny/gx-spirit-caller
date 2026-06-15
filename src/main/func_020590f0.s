; func_020590f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100364
        .extern data_02100478
        .extern data_02100514
        .extern data_02100520
        .extern data_02100528
        .extern data_02100530
        .extern data_02100540
        .extern data_0210054c
        .extern data_02100558
        .extern data_02100568
        .extern data_02100574
        .extern data_0219e434
        .extern func_020548f4
        .extern func_02054ad0
        .extern func_02054b00
        .extern func_02058038
        .extern func_02058070
        .extern func_020aaddc
        .global func_020590f0
        .arm
func_020590f0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xec
    mov fp, r0
    ldr r4, [fp]
    ldr r0, _LIT0
    mov r5, r1
    add r0, r4, r0
    bl func_020aaddc
    mov r9, r0
    ldr r0, _LIT1
    bl func_02054b00
    cmp r9, #0x0
    mov sl, #0x0
    bls .L_10c4
    add r8, sp, #0x0
    mov r7, sl
    mov r6, #0xff
.L_1094:
    mov r0, r7
    mov r1, r6
    bl func_02054ad0
    add r1, r4, sl
    add r1, r1, #0x100
    add sl, sl, #0x1
    ldrsb r1, [r1, #0x77]
    mov r0, r0, lsl #0x18
    cmp sl, r9
    eor r0, r1, r0, asr #0x18
    strb r0, [r8], #0x1
    bcc .L_1094
.L_10c4:
    add r0, sp, #0x0
    mov r6, #0x0
    add r1, sp, #0x1f
    mov r2, r9
    mov r3, #0x1
    strb r6, [r0, sl]
    bl func_020548f4
    ldr r2, _LIT2
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, _LIT3
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, fp
    add r1, r4, #0x1f4
    add r2, r4, #0x144
    bl func_02058070
    ldr r2, _LIT4
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, fp
    add r1, r4, #0x1f4
    add r2, r4, #0x110
    bl func_02058070
    ldr r2, _LIT5
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, fp
    add r1, r4, #0x1f4
    add r2, sp, #0x1f
    bl func_02058070
    ldr r2, _LIT6
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, [r4, #0x46c]
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058038
    ldr r2, _LIT7
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, _LIT8
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, _LIT9
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, [r4, #0x470]
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058038
    ldr r2, _LIT10
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, _LIT11
    mov r0, fp
    add r1, r4, #0x1f4
    add r2, r4, r2
    bl func_02058070
    add r0, r5, #0x200
    ldrsb r0, [r0, #0xc2]
    cmp r0, #0x0
    beq .L_1280
    ldr r0, _LIT12
    add r0, r5, r0
    bl func_020aaddc
    mov sl, r0
    ldr r0, _LIT1
    bl func_02054b00
    cmp sl, #0x0
    mov r8, r6
    bls .L_1244
    add r9, sp, #0x4c
    mov r7, r8
    mov r6, #0xff
.L_1214:
    mov r0, r7
    mov r1, r6
    bl func_02054ad0
    add r1, r5, r8
    add r1, r1, #0x200
    add r8, r8, #0x1
    ldrsb r1, [r1, #0xc2]
    mov r0, r0, lsl #0x18
    cmp r8, sl
    eor r0, r1, r0, asr #0x18
    strb r0, [r9], #0x1
    bcc .L_1214
.L_1244:
    add r0, sp, #0x4c
    mov r5, #0x0
    add r1, sp, #0x8d
    mov r2, sl
    mov r3, #0x1
    strb r5, [r0, r8]
    bl func_020548f4
    ldr r2, _LIT13
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058070
    add r2, sp, #0x8d
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058070
.L_1280:
    ldr r2, _LIT14
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, _LIT15
    mov r0, fp
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, #0x0
    add sp, sp, #0xec
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000177
_LIT1: .word 0x79707367
_LIT2: .word data_02100514
_LIT3: .word data_02100520
_LIT4: .word data_02100528
_LIT5: .word data_02100530
_LIT6: .word data_02100540
_LIT7: .word data_0210054c
_LIT8: .word data_0219e434
_LIT9: .word data_02100558
_LIT10: .word data_02100478
_LIT11: .word 0x0000012f
_LIT12: .word 0x000002c2
_LIT13: .word data_02100568
_LIT14: .word data_02100574
_LIT15: .word data_02100364
