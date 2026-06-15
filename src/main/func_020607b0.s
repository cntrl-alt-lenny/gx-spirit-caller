; func_020607b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210137c
        .extern data_02101388
        .extern data_02101394
        .extern data_021013a0
        .extern func_020608b4
        .extern func_02060958
        .extern func_02060a3c
        .extern func_02060ad4
        .extern func_020ab054
        .global func_020607b0
        .arm
func_020607b0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    ldr r1, _LIT0
    mov r5, r0
    mov r3, #0x0
    mov r2, #0x8
    strb r3, [r5, r4]
    bl func_020ab054
    cmp r0, #0x0
    bne .L_340
    mov r0, r5
    mov r1, r4
    bl func_02060ad4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_340:
    ldr r1, _LIT1
    mov r0, r5
    mov r2, #0x9
    bl func_020ab054
    cmp r0, #0x0
    bne .L_36c
    mov r0, r5
    mov r1, r4
    bl func_02060a3c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_36c:
    ldr r1, _LIT1
    mov r0, r5
    mov r2, #0x9
    bl func_020ab054
    cmp r0, #0x0
    bne .L_398
    mov r0, r5
    mov r1, r4
    bl func_02060a3c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_398:
    ldr r1, _LIT2
    mov r0, r5
    mov r2, #0x8
    bl func_020ab054
    cmp r0, #0x0
    bne .L_3c4
    mov r0, r5
    mov r1, r4
    bl func_02060958
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_3c4:
    ldr r1, _LIT3
    mov r0, r5
    mov r2, #0x8
    bl func_020ab054
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_020608b4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0210137c
_LIT1: .word data_02101388
_LIT2: .word data_02101394
_LIT3: .word data_021013a0
