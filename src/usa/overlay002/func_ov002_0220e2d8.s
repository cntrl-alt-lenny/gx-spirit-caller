; func_ov002_0220e2d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_0202f478
        .extern func_0202f4ac
        .extern func_ov002_021b9dec
        .extern func_ov002_021c2d54
        .extern func_ov002_021ca5b8
        .global func_ov002_0220e2d8
        .arm
func_ov002_0220e2d8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2d54
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021ca5b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr ip, _LIT0
    mov r3, #0x0
    ldr r5, [ip, #0x5d4]
    cmp r5, #0x0
    bls .L_134
    ldr r4, _LIT1
    ldr r7, _LIT2
    ldr r0, [r4, #0x4]
    ldr r1, _LIT3
    and r2, r0, #0x1
    mla r7, r2, r1, r7
    ldr r1, [r4, #0x20]
    mov r2, #0x14
    mla r7, r1, r2, r7
    ldr lr, [r4]
    ldrh r7, [r7, #0x38]
    ldr r4, [r4, #0x8]
    mov r2, ip
.L_90:
    ldrb r8, [ip, #0x5dc]
    cmp r8, #0x12
    bne .L_124
    add r8, r2, r3, lsl #0x2
    ldr r8, [r8, #0x5fc]
    cmp r8, #0x0
    beq .L_124
    ldrh r8, [r6, #0x2]
    mov r8, r8, lsl #0x1f
    mov r8, r8, lsr #0x1f
    rsb r8, r8, #0x1
    cmp lr, r8
    cmpeq r4, #0x0
    bne .L_124
    cmp r7, #0x0
    beq .L_124
    ldrh r3, [r6]
    ldr r2, _LIT4
    cmp r3, r2
    beq .L_f0
    add r2, r2, #0x80
    cmp r3, r2
    beq .L_108
    b .L_11c
.L_f0:
    bl func_ov002_021b9dec
    bl func_0202f478
    cmp r0, #0x0
    bne .L_11c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_108:
    bl func_ov002_021b9dec
    bl func_0202f4ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_11c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_124:
    add r3, r3, #0x1
    cmp r3, r5
    add ip, ip, #0x1
    bcc .L_90
.L_134:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd314
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
_LIT4: .word 0x00001aac
