; func_ov002_022b4840 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov002_022cd65c
        .extern data_ov002_022cd664
        .extern data_ov002_022d0e9c
        .extern func_0207ef74
        .extern func_ov002_021ca618
        .global func_ov002_022b4840
        .arm
func_ov002_022b4840:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r8, r0
    ldr r0, [r8, #0xc]
    cmp r0, #0x0
    addlt sp, sp, #0xc
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r3, [r8, #0x20]
    mov r0, #0xa
    cmp r3, #0x80
    mov r1, #0x32
    ble .L_4c
    rsb r2, r3, #0x100
    mul r3, r2, r1
    mov r1, r3, asr #0x6
    add r1, r3, r1, lsr #0x19
    mov sl, r1, asr #0x7
    ldr r2, [r8, #0x14]
    b .L_60
.L_4c:
    mul r2, r3, r1
    mov r1, r2, asr #0x6
    add r1, r2, r1, lsr #0x19
    ldr r2, [r8, #0x10]
    mov sl, r1, asr #0x7
.L_60:
    ldr r1, [r8, #0x8]
    mov r5, #0x0
    cmp r1, #0x4
    rsblt r1, r1, #0x4
    sublt r0, r0, r1, lsl #0x3
    ldr r1, _LIT0
    strh r5, [sp, #0x8]
    str r1, [sp, #0x4]
    cmp r2, #0x7
    beq .L_198
    mov r4, #0x400
    ldr fp, _LIT1
    mov r6, r5
    and r7, r0, #0xff
    mov r9, #0x46
    rsb r4, r4, #0x0
.L_a0:
    rsb r0, r6, #0x1
    mla r1, sl, r0, r9
    ldr r0, [sp, #0x4]
    mov r1, r1, lsl #0x17
    and r0, r0, fp
    orr r0, r0, r7
    orr r0, r0, r1, lsr #0x7
    str r0, [sp, #0x4]
    ldr r2, [r8, #0x18]
    ldrh r0, [sp, #0x8]
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1e
    mov r1, r1, lsr #0x16
    add r2, r1, #0x2e80
    mov r1, r2, asr #0x4
    add r1, r2, r1, lsr #0x1b
    and r0, r0, r4
    orr r2, r0, r1, asr #0x5
    strh r2, [sp, #0x8]
    ldr r0, _LIT2
    add r1, sp, #0x4
    mov r2, #0x1
    bl func_0207ef74
    add r5, r5, #0x1
    cmp r5, #0x2
    add r6, r6, #0x2
    add r9, r9, #0x64
    blt .L_a0
    mov r9, #0x400
    rsb fp, sl, #0xaa
    mov r4, #0x0
    mov r5, #0x58
    mov r6, #0x2980
    add sl, sl, #0x46
    rsb r9, r9, #0x0
.L_134:
    cmp sl, r5
    cmplt r5, fp
    bge .L_184
    ldr r2, [sp, #0x4]
    ldr r0, _LIT1
    ldrh r1, [sp, #0x8]
    and r0, r2, r0
    orr r0, r0, r7
    mov r2, r5, lsl #0x17
    orr r0, r0, r2, lsr #0x7
    str r0, [sp, #0x4]
    mov r0, r6, asr #0x4
    and r1, r1, r9
    add r0, r6, r0, lsr #0x1b
    orr r1, r1, r0, asr #0x5
    strh r1, [sp, #0x8]
    ldr r0, _LIT2
    add r1, sp, #0x4
    mov r2, #0x1
    bl func_0207ef74
.L_184:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r5, r5, #0x10
    add r6, r6, #0x100
    blt .L_134
.L_198:
    ldr r0, [r8, #0x8]
    mov r4, #0x400
    rsb r0, r0, #0x4
    mov r0, r0, lsl #0x3
    rsb r0, r0, #0xa
    ldr r5, _LIT1
    ldr r6, _LIT3
    mov r9, #0x0
    str r0, [sp]
    and sl, r0, #0xff
    rsb r4, r4, #0x0
    mov fp, #0x34
    mov r7, #0xbd
.L_1cc:
    ldr r0, [r6, #0x4]
    ldr r1, [sp, #0x4]
    eor r0, r0, #0x1
    cmp r9, r0
    moveq r0, r7
    movne r0, fp
    and r1, r1, r5
    mov r2, r0, lsl #0x17
    orr r1, r1, sl
    orr r1, r1, r2, lsr #0x7
    mov r0, r9
    str r1, [sp, #0x4]
    bl func_ov002_021ca618
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x8
    ldrh r3, [sp, #0x8]
    add r1, r0, #0x3d80
    mov r0, r1, asr #0x4
    add r2, r1, r0, lsr #0x1b
    and r3, r3, r4
    orr r2, r3, r2, asr #0x5
    strh r2, [sp, #0x8]
    ldr r0, _LIT2
    add r1, sp, #0x4
    mov r2, #0x1
    bl func_0207ef74
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_1cc
    ldr r0, _LIT4
    mov r1, #0x1
    ldr r0, [r0, #0xb88]
    cmp r0, #0x1
    cmpne r0, #0x2
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_38c
    ldr r0, [sp]
    ldr r2, [sp, #0x4]
    ldr r1, _LIT5
    add r0, r0, #0x10
    and r1, r2, r1
    mov r5, #0x0
    mov r4, #0x400
    ldr fp, _LIT1
    mov r7, r5
    str r1, [sp, #0x4]
    and r9, r0, #0xff
    rsb r4, r4, #0x0
.L_298:
    ldr r0, _LIT3
    ldrh r2, [sp, #0x8]
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r5, r0
    ldr r0, _LIT4
    moveq sl, #0xbd
    add r0, r0, r5, lsl #0x2
    ldr r6, [r0, #0xb94]
    movne sl, #0x34
    ldr r0, [sp, #0x4]
    mov r1, sl, lsl #0x17
    and r0, r0, fp
    orr r0, r0, r9
    orr r0, r0, r1, lsr #0x7
    cmp r6, r5
    str r0, [sp, #0x4]
    movgt r0, #0x1
    movle r0, #0x0
    add r0, r7, r0
    mov r0, r0, lsl #0x6
    add r1, r0, #0x3280
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    and r1, r2, r4
    orr r0, r1, r0, asr #0x5
    strh r0, [sp, #0x8]
    ldr r0, _LIT2
    add r1, sp, #0x4
    mov r2, #0x1
    bl func_0207ef74
    add r0, sl, #0x8
    mov r1, r0, lsl #0x17
    ldr r0, [sp, #0x4]
    cmp r5, #0x0
    and r0, r0, fp
    orr r0, r0, r9
    orr r0, r0, r1, lsr #0x7
    str r0, [sp, #0x4]
    moveq r0, #0x1
    movne r0, #0x0
    cmp r6, r0
    movgt r0, #0x1
    movle r0, #0x0
    add r0, r7, r0
    mov r0, r0, lsl #0x6
    add r1, r0, #0x3280
    mov r0, r1, asr #0x4
    ldrh r2, [sp, #0x8]
    add r0, r1, r0, lsr #0x1b
    and r1, r2, r4
    orr r0, r1, r0, asr #0x5
    strh r0, [sp, #0x8]
    ldr r0, _LIT2
    add r1, sp, #0x4
    mov r2, #0x1
    bl func_0207ef74
    add r5, r5, #0x1
    add r7, r7, #0x2
    cmp r5, #0x2
    blt .L_298
.L_38c:
    ldr r0, [r8, #0x64]
    cmp r0, #0x0
    bne .L_474
    ldr r0, _LIT3
    ldr r1, _LIT6
    ldr r0, [r0, #0x4]
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x0
    bne .L_474
    bl func_ov002_021ca618
    cmp r0, #0x0
    beq .L_474
    ldr r2, [r8, #0x18]
    mov r1, #0x400
    mov r0, r2, asr #0x2
    add r0, r2, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    and r0, r0, #0x3
    add r4, r0, #0x9d
    ldr r3, [sp, #0x4]
    ldr r0, _LIT5
    ldr r2, _LIT1
    and r0, r3, r0
    orr r0, r0, #-2147483648
    ldrh r3, [sp, #0x8]
    rsb r1, r1, #0x0
    and r4, r4, #0xff
    and r0, r0, r2
    orr r0, r0, r4
    orr r2, r0, #0x700000
    and r1, r3, r1
    orr r3, r1, #0x1fc
    str r2, [sp, #0x4]
    ldr r0, _LIT2
    add r1, sp, #0x4
    mov r2, #0x1
    strh r3, [sp, #0x8]
    bl func_0207ef74
    ldr r2, [sp, #0x4]
    ldr r1, _LIT1
    ldr r0, _LIT2
    and r1, r2, r1
    orr r1, r1, r4
    orr r2, r1, #0xd40000
    str r2, [sp, #0x4]
    add r1, sp, #0x4
    mov r2, #0x1
    bl func_0207ef74
    ldr r2, [sp, #0x4]
    ldr r1, _LIT1
    ldr r0, _LIT2
    and r1, r2, r1
    orr r1, r1, r4
    orr r3, r1, #0xc0000
    add r1, sp, #0x4
    mov r2, #0x1
    str r3, [sp, #0x4]
    bl func_0207ef74
.L_474:
    ldr r0, [r8, #0x1c]
    cmp r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x40002000
_LIT1: .word 0xfe00ff00
_LIT2: .word data_ov002_022d0e9c
_LIT3: .word data_ov002_022cd65c
_LIT4: .word data_02103fcc
_LIT5: .word 0x3fff3fff
_LIT6: .word data_ov002_022cd664
