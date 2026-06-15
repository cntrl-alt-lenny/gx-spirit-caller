; func_02058334 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100260
        .extern data_02100280
        .extern data_02100290
        .extern func_020453b4
        .extern func_020a6d54
        .global func_02058334
        .arm
func_02058334:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    ldr r1, [r7]
    mov r4, r0
    cmp r1, #0x0
    bne .L_2c0
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x6e
    bl func_020a6d54
.L_2c0:
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    bne .L_2e0
    ldr r0, _LIT2
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x6f
    bl func_020a6d54
.L_2e0:
    ldr r1, [r7, #0x8]
    ldr r2, [r7, #0x4]
    ldr r3, [r7]
    mov r0, r4
    blx r3
    ldr r0, [r7, #0xc]
    cmp r0, #0x2
    bne .L_31c
    ldr r0, [r7, #0x8]
    ldr r0, [r0, #0x8]
    bl func_020453b4
    ldr r0, [r7, #0x8]
    mov r1, #0x0
    str r1, [r0, #0x8]
    b .L_460
.L_31c:
    cmp r0, #0x3
    bne .L_39c
    ldr r5, [r7, #0x8]
    mov r6, #0x0
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    ble .L_378
    mov r4, r6
    mov r8, r6
.L_340:
    ldr r0, [r5, #0x3c]
    ldr r0, [r0, r6, lsl #0x2]
    bl func_020453b4
    ldr r0, [r5, #0x3c]
    str r4, [r0, r6, lsl #0x2]
    ldr r0, [r5, #0x40]
    ldr r0, [r0, r6, lsl #0x2]
    bl func_020453b4
    ldr r0, [r5, #0x40]
    str r8, [r0, r6, lsl #0x2]
    ldr r0, [r5, #0x38]
    add r6, r6, #0x1
    cmp r6, r0
    blt .L_340
.L_378:
    ldr r0, [r5, #0x3c]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r5, #0x3c]
    ldr r0, [r5, #0x40]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r5, #0x40]
    b .L_460
.L_39c:
    cmp r0, #0x4
    bne .L_3bc
    ldr r4, [r7, #0x8]
    ldr r0, [r4, #0xc]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0xc]
    b .L_460
.L_3bc:
    cmp r0, #0x7
    bne .L_3e4
    ldr r4, [r7, #0x8]
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_460
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x10]
    b .L_460
.L_3e4:
    cmp r0, #0x8
    bne .L_40c
    ldr r4, [r7, #0x8]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_460
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x8]
    b .L_460
.L_40c:
    cmp r0, #0x9
    bne .L_460
    ldr r4, [r7, #0x8]
    mov r5, #0x0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    ble .L_450
    mov r6, r5
.L_42c:
    ldr r0, [r4, #0x8]
    ldr r0, [r0, r5, lsl #0x2]
    bl func_020453b4
    ldr r0, [r4, #0x8]
    str r6, [r0, r5, lsl #0x2]
    ldr r0, [r4, #0x4]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_42c
.L_450:
    ldr r0, [r4, #0x8]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_460:
    ldr r0, [r7, #0x8]
    bl func_020453b4
    mov r1, #0x0
    mov r0, r7
    str r1, [r7, #0x8]
    bl func_020453b4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02100260
_LIT1: .word data_02100280
_LIT2: .word data_02100290
