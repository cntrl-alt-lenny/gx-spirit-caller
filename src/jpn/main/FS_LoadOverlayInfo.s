; FS_LoadOverlayInfo — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8244
        .extern data_021a824c
        .extern data_021a8254
        .extern func_02094688
        .extern func_02097efc
        .extern func_02097f94
        .extern func_02098294
        .extern func_02098a6c
        .extern func_02098b7c
        .global FS_LoadOverlayInfo
        .arm
FS_LoadOverlayInfo:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x64
    movs r4, r1
    mov r5, r0
    ldreq r0, _LIT0
    ldrne r0, _LIT1
    ldr r3, [r0]
    cmp r3, #0x0
    beq .L_bc
    ldr r0, [r0, #0x4]
    mov r2, r2, lsl #0x5
    cmp r2, r0
    addcs sp, sp, #0x64
    movcs r0, #0x0
    ldmcsia sp!, {r4, r5, lr}
    bxcs lr
    add r0, r3, r2
    mov r1, r5
    mov r2, #0x20
    bl func_02094688
    add r0, sp, #0x18
    str r4, [r5, #0x20]
    bl func_02098294
    add r0, sp, #0x10
    mov r1, r5
    bl func_02098b7c
    add r1, sp, #0x10
    add r0, sp, #0x18
    ldmia r1, {r1, r2}
    bl func_02097f94
    cmp r0, #0x0
    addeq sp, sp, #0x64
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r1, [sp, #0x3c]
    add r0, sp, #0x18
    str r1, [r5, #0x24]
    ldr r2, [sp, #0x40]
    ldr r1, [sp, #0x3c]
    sub r1, r2, r1
    str r1, [r5, #0x28]
    bl func_02097efc
    add sp, sp, #0x64
    mov r0, #0x1
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_bc:
    ldr r1, _LIT2
    ldr ip, _LIT3
    ldr r0, [r1]
    ldr r3, _LIT4
    str r0, [sp]
    ldr r1, [r1, #0x4]
    mov r0, r5
    str r1, [sp, #0x4]
    ldr r5, [ip]
    mov r1, r4
    str r5, [sp, #0x8]
    ldr r4, [ip, #0x4]
    str r4, [sp, #0xc]
    bl func_02098a6c
    add sp, sp, #0x64
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a8244
_LIT1: .word data_021a824c
_LIT2: .word 0x027ffe50
_LIT3: .word 0x027ffe58
_LIT4: .word data_021a8254
