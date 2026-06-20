; func_ov002_022bc0b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccfd8
        .extern data_ov002_022d1af8
        .extern data_ov002_022d28fc
        .extern func_02037208
        .extern func_020a978c
        .extern func_ov002_022bdb88
        .global func_ov002_022bc0b8
        .arm
func_ov002_022bc0b8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0xc60]
    cmp r0, #0x0
    beq .L_430
    cmp r0, #0x1
    beq .L_50c
    cmp r0, #0x2
    beq .L_5b0
    b .L_5d8
.L_430:
    ldr r3, [r5, #0xc5c]
    ldr r0, _LIT0
    ldr r2, [r5, #0xc58]
    cmp r3, r0
    bne .L_460
    rsb r2, r2, #0x14
    cmp r2, #0x62
    movgt r2, #0x62
    bgt .L_474
    cmp r2, #0x0
    movlt r2, #0x0
    b .L_474
.L_460:
    cmp r2, #0x63
    movgt r2, #0x63
    bgt .L_474
    cmp r2, #0x1
    movlt r2, #0x1
.L_474:
    add r0, r5, #0xc00
    ldrh r1, [r0, #0x68]
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x10
    movcc r4, #0x1
    movcs r4, #0x0
    cmp r4, #0x0
    strh r1, [sp, #0x4]
    orreq r2, r2, #0x100
    beq .L_4a8
    cmp r0, #0x4
    orrcc r2, r2, #0x200
.L_4a8:
    ldr r0, _LIT0
    mov r1, #0x0
    cmp r3, r0
    str r1, [sp]
    ldr r0, _LIT1
    orreq r2, r2, #0x400
    add r3, r5, #0xc80
    mov r1, #0xe
    bl func_ov002_022bdb88
    add r0, r5, #0x124
    ldr r2, [r5, #0xc5c]
    ldr r1, _LIT2
    add r0, r0, #0x800
    bl func_020a978c
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0, #0x4]
    cmp r4, #0x0
    moveq r1, #0x1
    str r1, [r5, #0xcf0]
    mov r0, #0x1
    str r0, [r5, #0xc60]
    mov r0, #0x0
    str r0, [r5, #0xc64]
    b .L_5d8
.L_50c:
    ldr r1, [r5, #0xc5c]
    ldr r0, _LIT0
    ldr r4, _LIT1
    cmp r1, r0
    ldr r0, [r5, #0xc64]
    bne .L_544
    cmp r0, #0x12
    bne .L_560
    mov r0, #0x5b
    sub r1, r0, #0x5c
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_560
.L_544:
    cmp r0, #0x30
    bne .L_560
    mov r0, #0x5d
    sub r1, r0, #0x5e
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_560:
    mov r1, #0x0
.L_564:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_580
    ldr r0, [r4, #0x4]
    cmp r0, #0xe
    moveq r0, #0x1
    beq .L_594
.L_580:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r4, r4, #0x8
    blt .L_564
    mov r0, #0x0
.L_594:
    cmp r0, #0x0
    bne .L_5d8
    mov r0, #0x2
    str r0, [r5, #0xc60]
    mov r0, #0x0
    str r0, [r5, #0xc64]
    b .L_5d8
.L_5b0:
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xcf0]
    mov r1, #0xc
    str r1, [r5, #0xcc8]
    add sp, sp, #0x8
    str r0, [r5, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_5d8:
    ldr r1, [r5, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r5, #0xc64]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000169c
_LIT1: .word data_ov002_022d28fc
_LIT2: .word data_ov002_022ccfd8
_LIT3: .word data_ov002_022d1af8
