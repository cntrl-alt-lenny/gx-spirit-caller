; func_ov002_022b4ce0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0e9c
        .extern func_0207ef74
        .extern func_0208e2f4
        .global func_ov002_022b4ce0
        .arm
func_ov002_022b4ce0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    str r0, [sp]
    ldr r0, [r0]
    cmp r0, #0x0
    ldrne r0, [sp]
    ldrne r0, [r0, #0x68]
    cmpne r0, #0x0
    addeq sp, sp, #0x18
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    mov r6, #0x0
    str r0, [sp, #0x10]
    ldr r0, [sp]
    strh r6, [sp, #0x14]
    ldr r2, [r0, #0x68]
    cmp r2, #0x20
    bge .L_914
    mov r0, #0x7c
    rsb r1, r2, #0x20
    mul r2, r1, r0
    mov r1, r2, asr #0x4
    add r1, r2, r1, lsr #0x1b
    ldr r3, _LIT1
    ldr r2, _LIT2
    add r0, r0, #0x4400
    strh r3, [r2]
    strh r0, [r2, #0x4]
    mov r6, r1, asr #0x5
    b .L_a3c
.L_914:
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_a3c
    cmp r2, #0x30
    bge .L_994
    ldr r5, _LIT3
    mov r4, #0x4000000
    ldrh r1, [r5]
    rsb r0, r2, #0x30
    mov r0, r0, lsl #0x1
    bic r1, r1, #0x3f
    orr r1, r1, #0x3f
    strh r1, [r5]
    ldrh r3, [r5, #0x2]
    mov r2, r0, lsr #0x1f
    rsb r1, r2, r0, lsl #0x1c
    bic r0, r3, #0x3f
    orr r0, r0, #0x1f
    strh r0, [r5, #0x2]
    ldr r3, [r4]
    ldr r0, _LIT1
    bic r3, r3, #0xe000
    orr r3, r3, #0x2000
    str r3, [r4]
    ldr r3, _LIT4
    strh r0, [r4, #0x40]
    add r0, r4, #0x50
    add r2, r2, r1, ror #0x1c
    mov r1, #0x10
    strh r3, [r4, #0x44]
    bl func_0208e2f4
    b .L_a3c
.L_994:
    cmp r2, #0x40
    ldr r4, _LIT2
    bge .L_a08
    sub r0, r2, #0x30
    mov r1, r0, lsl #0x6
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    rsb r0, r1, #0x60
    mov r2, r0, lsl #0x8
    add r0, r1, #0x60
    ldr r3, _LIT1
    mov r1, #0x1
    and r2, r2, #0xff00
    and r0, r0, #0xff
    strh r3, [r4]
    orr r3, r2, r0
    add r0, r4, #0x10
    sub r2, r1, #0xd
    strh r3, [r4, #0x4]
    bl func_0208e2f4
    mov r1, #0x4000000
    ldr r0, [r1]
    bic r0, r0, #0xe000
    orr r0, r0, #0x2000
    str r0, [r1]
    b .L_a3c
.L_a08:
    ldr r0, _LIT1
    mov r1, #0x1
    strh r0, [r4]
    ldr r3, _LIT5
    add r0, r4, #0x10
    sub r2, r1, #0xd
    strh r3, [r4, #0x4]
    bl func_0208e2f4
    mov r1, #0x4000000
    ldr r0, [r1]
    bic r0, r0, #0xe000
    orr r0, r0, #0x2000
    str r0, [r1]
.L_a3c:
    ldr r0, _LIT6
    mov r4, #0x400
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x20
    rsb fp, r6, #0x0
    str r0, [sp, #0x4]
    rsb r4, r4, #0x0
.L_a60:
    ldr r0, [sp, #0xc]
    ldr r8, [sp, #0x8]
    and sl, r0, #0x1
    ldr r0, [sp, #0x4]
    mov r7, #0x0
    mov r9, #0x44
    mov r5, r0, lsl #0x17
.L_a7c:
    ldrh r1, [sp, #0x14]
    mov r0, r8, asr #0x4
    add r0, r8, r0, lsr #0x1b
    and r1, r1, r4
    orr r0, r1, r0, asr #0x5
    cmp sl, #0x0
    strh r0, [sp, #0x14]
    movne r0, r6
    moveq r0, fp
    add r0, r9, r0
    and r2, r0, #0xff
    ldr r3, [sp, #0x10]
    ldr r1, _LIT7
    ldr r0, _LIT8
    and r1, r3, r1
    orr r1, r1, r2
    orr r1, r1, r5, lsr #0x7
    str r1, [sp, #0x10]
    add r1, sp, #0x10
    mov r2, #0x1
    bl func_0207ef74
    add r7, r7, #0x1
    add r8, r8, #0x180
    add r9, r9, #0x18
    cmp r7, #0x2
    blt .L_a7c
    ldr r0, [sp, #0xc]
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    cmp r0, #0xc
    ldr r0, [sp, #0x8]
    add r0, r0, #0x380
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x4]
    add r0, r0, #0x10
    str r0, [sp, #0x4]
    blt .L_a60
    ldr r0, [sp]
    ldr r0, [r0, #0x68]
    add r1, r0, #0x2
    ldr r0, [sp]
    str r1, [r0, #0x68]
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x8000a000
_LIT1: .word 0x000001ff
_LIT2: .word 0x04000040
_LIT3: .word 0x04000048
_LIT4: .word 0x0000447c
_LIT5: .word 0x00004080
_LIT6: .word 0x00004780
_LIT7: .word 0xfe00ff00
_LIT8: .word data_ov002_022d0e9c
