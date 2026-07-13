; func_ov003_021ceae8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104c0c
        .extern data_ov003_021cf580
        .extern func_020371b8
        .extern func_ov003_021cecbc
        .global func_ov003_021ceae8
        .arm
func_ov003_021ceae8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x50]
    mov r2, #0x0
    cmp r0, #0x0
    ldr r0, _LIT1
    movlt r3, #0x1
    ldr r0, [r0, #0xc3c]
    movge r3, r2
    ldr r1, _LIT2
    eor r0, r0, r3
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    cmpne r0, #0x2
    ldr r0, [r4, #0x4]
    moveq r2, #0x1
    cmp r0, #0x3
    beq .L_1de0
    cmp r0, #0xb
    beq .L_1de4
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
.L_1de0:
    mov r2, #0x0
.L_1de4:
    cmp r2, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x18
    str r0, [sp]
    mov r0, #0x90
    str r0, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r3, #0x0
    str r3, [sp, #0xc]
    mov r0, #0xc00
    str r0, [sp, #0x10]
    str r3, [sp, #0x14]
    ldr r2, [r4, #0x24]
    mov r0, r4
    mov r1, #0x2
    bl func_ov003_021cecbc
    ldr ip, [r4, #0xc]
    cmp ip, #0x168
    bge .L_1e7c
    mov r0, #0x18
    str r0, [sp]
    mov r0, #0x90
    str r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    mov r0, #0xc00
    str r0, [sp, #0x10]
    str r1, [sp, #0x14]
    mov r1, #0x2
    ldr r2, [r4, #0x28]
    mov r0, r4
    sub r3, r1, #0x3
    bl func_ov003_021cecbc
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
.L_1e7c:
    ldr r2, _LIT3
    mov r0, ip, lsr #0x1f
    smull r1, r3, r2, ip
    add r3, ip, r3
    add r3, r0, r3, asr #0x5
    mov r2, #0x3c
    smull r0, r1, r2, r3
    subs r3, ip, r0
    bne .L_1eb4
    mov r0, #0x8e
    sub r1, r0, #0x8f
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_1eb4:
    ldr r1, [r4, #0xc]
    mov r0, #0x18
    mov r1, r1, asr #0x2
    str r0, [sp]
    mov r0, #0x90
    str r0, [sp, #0x4]
    and r5, r1, #0x1
    str r5, [sp, #0x8]
    mov r2, #0x0
    mov r1, #0x2
    str r2, [sp, #0xc]
    mov r0, #0xc00
    str r0, [sp, #0x10]
    str r2, [sp, #0x14]
    ldr r2, [r4, #0x2c]
    mov r0, r4
    sub r3, r1, #0x3
    bl func_ov003_021cecbc
    mov r0, #0x18
    mov r1, #0x2
    str r0, [sp]
    mov r0, #0x90
    str r0, [sp, #0x4]
    rsb r0, r5, #0x1
    str r0, [sp, #0x8]
    mov r2, #0x0
    str r2, [sp, #0xc]
    mov r0, #0xc00
    str r0, [sp, #0x10]
    str r2, [sp, #0x14]
    ldr r2, [r4, #0x28]
    mov r0, r4
    sub r3, r1, #0x3
    bl func_ov003_021cecbc
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov003_021cf580
_LIT1: .word data_02103fcc
_LIT2: .word data_02104c0c
_LIT3: .word 0x88888889
