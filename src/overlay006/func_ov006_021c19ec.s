; func_ov006_021c19ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0225cb7c
        .extern data_ov006_0225cb88
        .extern data_ov006_0225cbb8
        .extern func_020215d8
        .extern func_02022234
        .extern func_0202224c
        .extern func_02023188
        .extern func_ov006_021c1cc0
        .extern func_ov006_021c1d74
        .extern func_ov006_021c2280
        .extern func_ov006_021c2510
        .extern func_ov006_021c4518
        .extern func_ov006_021c480c
        .global func_ov006_021c19ec
        .arm
func_ov006_021c19ec:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r0, #0x0
    bl func_0202224c
    ldr r1, [r5, #0x44]
    mov r4, r0
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_2a0
    b .L_40
    b .L_94
    b .L_114
    b .L_13c
    b .L_218
    b .L_258
    b .L_298
.L_40:
    ldr r0, [r5, #0x48]
    cmp r0, #0x3
    bne .L_2a0
    ldr r0, [r5, #0x70]
    cmp r0, #0x0
    mov r0, r5
    beq .L_7c
    orr r4, r4, #0x10
    bl func_ov006_021c2280
    mov r1, #0x0
    str r1, [r5, #0x70]
    mov r0, #0x3
    str r0, [r5, #0x44]
    str r1, [r5, #0x48]
    b .L_2a0
.L_7c:
    bl func_ov006_021c1cc0
    mov r0, #0x1
    str r0, [r5, #0x44]
    mov r0, #0x0
    str r0, [r5, #0x48]
    b .L_2a0
.L_94:
    ldr r0, [r5, #0x48]
    cmp r0, #0x3
    bne .L_b0
    mov r0, r5
    mov r1, #0x1
    bl func_ov006_021c4518
    b .L_c8
.L_b0:
    cmp r0, #0x1e
    bne .L_c8
    mov r1, #0x1
    mov r0, r5
    str r1, [r5, #0x68]
    bl func_ov006_021c480c
.L_c8:
    mov r0, r5
    bl func_ov006_021c1d74
    cmp r0, #0x0
    beq .L_2a0
    ldr r0, [r5, #0x6c]
    cmp r0, #0x0
    beq .L_fc
    mov r0, #0x2
    str r0, [r5, #0x44]
    mov r0, #0x0
    str r0, [r5, #0x48]
    orr r4, r4, #0x10
    b .L_2a0
.L_fc:
    mov r0, #0x5
    str r0, [r5, #0x44]
    mov r0, #0x0
    str r0, [r5, #0x48]
    orr r4, r4, #0x1
    b .L_2a0
.L_114:
    ldr r0, [r5, #0x48]
    cmp r0, #0xa
    bne .L_2a0
    mov r0, r5
    bl func_ov006_021c2280
    mov r0, #0x3
    str r0, [r5, #0x44]
    mov r0, #0x0
    str r0, [r5, #0x48]
    b .L_2a0
.L_13c:
    ldr r0, [r5, #0x48]
    cmp r0, #0x3
    bne .L_158
    mov r0, r5
    mov r1, #0x1
    bl func_ov006_021c4518
    b .L_164
.L_158:
    cmp r0, #0xa
    moveq r0, #0x1
    streq r0, [r5, #0x68]
.L_164:
    mov r0, r5
    bl func_ov006_021c2510
    cmp r0, #0x0
    beq .L_2a0
    bl func_02023188
    ldr r0, [r5, #0x74]
    cmp r0, #0x0
    beq .L_200
    ldr r1, _LIT0
    ldr r6, _LIT1
    ldr r2, [r1, #0x94]
    ldr ip, _LIT2
    str r2, [r1, #0xc]
    ldr r2, [r1, #0xa0]
    orr r4, r4, #0x1
    str r2, [r1, #0x18]
    ldr r2, [r1, #0x98]
    mov r0, #0x0
    str r2, [r1, #0x10]
    ldr r2, [r1, #0x9c]
    str r2, [r1, #0x14]
.L_1b8:
    add lr, r6, r0, lsl #0x4
    ldr r2, [lr, #0x9c]
    add r3, ip, r0, lsl #0x4
    ldr r1, [lr, #0xa0]
    str r2, [r3, #0x10]
    add r0, r0, #0x1
    ldr r2, [lr, #0xa4]
    str r1, [r3, #0x14]
    ldr r1, [lr, #0xa8]
    str r2, [r3, #0x18]
    str r1, [r3, #0x1c]
    cmp r0, #0x2
    blt .L_1b8
    mov r0, #0x5
    str r0, [r5, #0x44]
    mov r0, #0x0
    str r0, [r5, #0x48]
    b .L_2a0
.L_200:
    mov r0, #0x4
    str r0, [r5, #0x44]
    mov r0, #0x0
    str r0, [r5, #0x48]
    orr r4, r4, #0x20
    b .L_2a0
.L_218:
    ldr r0, [r5, #0x48]
    cmp r0, #0x8
    bne .L_234
    mov r0, r5
    mov r1, #0x0
    bl func_ov006_021c4518
    b .L_2a0
.L_234:
    cmp r0, #0xa
    blt .L_2a0
    mov r0, r5
    bl func_ov006_021c1cc0
    mov r0, #0x1
    str r0, [r5, #0x44]
    mov r0, #0x0
    str r0, [r5, #0x48]
    b .L_2a0
.L_258:
    ldr r0, [r5, #0x48]
    cmp r0, #0xc
    bne .L_270
    mov r0, r5
    mov r1, #0x0
    bl func_ov006_021c4518
.L_270:
    ldr r0, [r5, #0x8]
    bl func_020215d8
    cmp r0, #0x0
    bne .L_2a0
    mov r1, #0x0
    str r1, [r5, #0x8]
    mov r0, #0x6
    str r0, [r5, #0x44]
    str r1, [r5, #0x48]
    b .L_2a0
.L_298:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_2a0:
    mov r1, r4
    mov r0, #0x0
    bl func_02022234
    ldr r1, [r5, #0x48]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x48]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov006_0225cb7c
_LIT1: .word data_ov006_0225cbb8
_LIT2: .word data_ov006_0225cb88
