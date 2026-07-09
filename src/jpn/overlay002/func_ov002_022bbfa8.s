; func_ov002_022bbfa8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccee4
        .extern data_ov002_022d1a18
        .extern data_ov002_022d281c
        .extern func_020371b8
        .extern func_020a9698
        .extern func_ov002_022bda78
        .global func_ov002_022bbfa8
        .arm
func_ov002_022bbfa8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0xc60]
    cmp r0, #0x0
    beq .L_25c
    cmp r0, #0x1
    beq .L_338
    cmp r0, #0x2
    beq .L_3dc
    b .L_404
.L_25c:
    ldr r3, [r5, #0xc5c]
    ldr r0, _LIT0
    ldr r2, [r5, #0xc58]
    cmp r3, r0
    bne .L_28c
    rsb r2, r2, #0x14
    cmp r2, #0x62
    movgt r2, #0x62
    bgt .L_2a0
    cmp r2, #0x0
    movlt r2, #0x0
    b .L_2a0
.L_28c:
    cmp r2, #0x63
    movgt r2, #0x63
    bgt .L_2a0
    cmp r2, #0x1
    movlt r2, #0x1
.L_2a0:
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
    beq .L_2d4
    cmp r0, #0x4
    orrcc r2, r2, #0x200
.L_2d4:
    ldr r0, _LIT0
    mov r1, #0x0
    cmp r3, r0
    str r1, [sp]
    ldr r0, _LIT1
    orreq r2, r2, #0x400
    add r3, r5, #0xc80
    mov r1, #0xe
    bl func_ov002_022bda78
    add r0, r5, #0x124
    ldr r2, [r5, #0xc5c]
    ldr r1, _LIT2
    add r0, r0, #0x800
    bl func_020a9698
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
    b .L_404
.L_338:
    ldr r1, [r5, #0xc5c]
    ldr r0, _LIT0
    ldr r4, _LIT1
    cmp r1, r0
    ldr r0, [r5, #0xc64]
    bne .L_370
    cmp r0, #0x12
    bne .L_38c
    mov r0, #0x5b
    sub r1, r0, #0x5c
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_38c
.L_370:
    cmp r0, #0x30
    bne .L_38c
    mov r0, #0x5d
    sub r1, r0, #0x5e
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_38c:
    mov r1, #0x0
.L_390:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_3ac
    ldr r0, [r4, #0x4]
    cmp r0, #0xe
    moveq r0, #0x1
    beq .L_3c0
.L_3ac:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r4, r4, #0x8
    blt .L_390
    mov r0, #0x0
.L_3c0:
    cmp r0, #0x0
    bne .L_404
    mov r0, #0x2
    str r0, [r5, #0xc60]
    mov r0, #0x0
    str r0, [r5, #0xc64]
    b .L_404
.L_3dc:
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
.L_404:
    ldr r1, [r5, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r5, #0xc64]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000169c
_LIT1: .word data_ov002_022d281c
_LIT2: .word data_ov002_022ccee4
_LIT3: .word data_ov002_022d1a18
