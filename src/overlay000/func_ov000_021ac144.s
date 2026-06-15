; func_ov000_021ac144 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006110
        .extern func_02006164
        .extern func_0200617c
        .extern func_02006194
        .extern func_ov000_021abe64
        .extern func_ov000_021abec8
        .extern func_ov000_021abf78
        .extern func_ov000_021abfbc
        .extern func_ov000_021abfec
        .extern func_ov000_021ac050
        .extern func_ov000_021ac098
        .global func_ov000_021ac144
        .arm
func_ov000_021ac144:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r1, [r6]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0xc]
    bic r1, r1, #0x3c000000
    orr r1, r1, #0x3c000000
    str r1, [r6, #0xc]
    bl func_ov000_021abe64
    ldr r2, [r6, #0xc]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x17
    and r1, r2, r1
    orr r0, r1, r0, lsr #0x6
    str r0, [r6, #0xc]
    bl func_02006194
    cmp r0, #0x0
    bne .L_114
    bl func_0200617c
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
.L_114:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    mov r0, r6
    bl func_ov000_021ac098
    ldr r1, [r6]
    mov r5, r0
    mov r0, r1, lsl #0x1a
    movs r0, r0, lsr #0x1c
    beq .L_154
    cmp r0, #0x1
    beq .L_2e0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_154:
    mov r0, r6
    bl func_ov000_021abe64
    mov r4, r0
    bl func_02006164
    cmp r0, #0x0
    beq .L_1e4
    ldr r1, [r6, #0xc]
    mov r0, r5, lsl #0x1c
    bic r1, r1, #0x3c000000
    orr r0, r1, r0, lsr #0x2
    str r0, [r6, #0xc]
    mov r0, r0, lsl #0x2
    ldr r1, [r6, #0x10]
    mov r0, r0, asr #0x1c
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    bic r0, r0, #0x1f0
    str r0, [r6, #0x10]
    ldr r0, [r6, #0xc]
    mov r0, r0, lsl #0x2
    mov r0, r0, asr #0x1c
    cmp r0, #0x3
    bne .L_1e4
    ldr r1, [r6]
    ldr r0, _LIT1
    bic r1, r1, #0x3c
    orr r1, r1, #0x4
    str r1, [r6]
    ldr r1, [sp]
    ldr r2, [r6, #0xc]
    sub r1, r4, r1
    and r2, r2, r0
    mov r0, r1, lsl #0x17
    orr r0, r2, r0, lsr #0xf
    str r0, [r6, #0xc]
.L_1e4:
    ldr r0, [r6, #0x10]
    mov r0, r0, lsl #0x1c
    cmp r5, r0, asr #0x1c
    bne .L_2b8
    bl func_02006194
    cmp r0, #0x0
    beq .L_214
    ldr r1, [r6, #0xc]
    mov r0, r5, lsl #0x1c
    bic r1, r1, #0x3c000000
    orr r0, r1, r0, lsr #0x2
    str r0, [r6, #0xc]
.L_214:
    ldr r0, [r6, #0x10]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1b
    tst r0, #0xf
    bne .L_284
    ldr r0, [r6, #0xc]
    mov r0, r0, lsl #0x2
    mov r0, r0, asr #0x1c
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_284
    b .L_284
    b .L_258
    b .L_264
    b .L_284
    b .L_270
    b .L_27c
.L_258:
    mov r0, r6
    bl func_ov000_021abfbc
    b .L_284
.L_264:
    mov r0, r6
    bl func_ov000_021ac050
    b .L_284
.L_270:
    mov r0, r6
    bl func_ov000_021abfec
    b .L_284
.L_27c:
    mov r0, r6
    bl func_ov000_021abf78
.L_284:
    ldr r1, [r6, #0x10]
    mov r0, r1, lsl #0x17
    mov r0, r0, lsr #0x1b
    cmp r0, #0x10
    biccs r0, r1, #0x1f0
    orrcs r0, r0, #0xd0
    strcs r0, [r6, #0x10]
    bcs .L_2b8
    add r0, r0, #0x1
    bic r1, r1, #0x1f0
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x17
    str r0, [r6, #0x10]
.L_2b8:
    mov r0, r6
    bl func_ov000_021abe64
    ldr r2, [r6, #0xc]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x17
    and r1, r2, r1
    orr r0, r1, r0, lsr #0x6
    add sp, sp, #0x8
    str r0, [r6, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
.L_2e0:
    bl func_0200617c
    cmp r0, #0x0
    beq .L_2fc
    ldr r0, [r6]
    bic r0, r0, #0x3c
    str r0, [r6]
    b .L_394
.L_2fc:
    ldmia r6, {r0, r5}
    mov r1, r0, lsl #0x8
    ldr r0, [r6, #0xc]
    mov ip, r5, lsl #0x10
    mov r2, r1, lsr #0x17
    add r1, r2, ip, lsr #0x18
    mov r4, r0, lsl #0xf
    ldr r3, [sp]
    sub r0, r1, r4, asr #0x17
    cmp r3, r0
    bcs .L_344
    ldr r2, [r6, #0xc]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x17
    and r0, r2, r0
    orr r0, r0, r1, lsr #0x6
    str r0, [r6, #0xc]
    b .L_394
.L_344:
    mov r0, r5, lsl #0x18
    add r0, r2, r0, lsr #0x18
    sub r1, r0, ip, lsr #0x18
    mov r0, r5, lsl #0x8
    sub r1, r1, r0, lsr #0x18
    sub r0, r1, r4, asr #0x17
    cmp r3, r0
    ldr r2, [r6, #0xc]
    ldr r0, _LIT0
    bls .L_380
    mov r1, r1, lsl #0x17
    and r0, r2, r0
    orr r0, r0, r1, lsr #0x6
    str r0, [r6, #0xc]
    b .L_394
.L_380:
    add r1, r3, r4, asr #0x17
    and r2, r2, r0
    mov r0, r1, lsl #0x17
    orr r0, r2, r0, lsr #0x6
    str r0, [r6, #0xc]
.L_394:
    mov r0, r6
    bl func_ov000_021abec8
    mov r1, r0, lsl #0x10
    mov r0, #0x10000
    mov r1, r1, lsr #0x10
    ldr r2, [r6, #0x8]
    rsb r0, r0, #0x0
    and r2, r2, r0
    mov r0, r1, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    str r0, [r6, #0x8]
    ldr r0, [r6, #0xc]
    bic r0, r0, #0x3c000000
    orr r0, r0, #0xc000000
    str r0, [r6, #0xc]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0xfc01ffff
_LIT1: .word 0xfffe00ff
