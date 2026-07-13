; func_ov014_021b3838 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_ov014_021b4af8
        .extern data_ov014_02234ff4
        .extern func_02001cec
        .extern func_02004f3c
        .extern func_02005488
        .extern func_0202c06c
        .extern func_0208dd64
        .extern func_02091554
        .extern func_02094410
        .global func_ov014_021b3838
        .arm
func_ov014_021b3838:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r4, #0x0
    ldr lr, _LIT0
    add ip, sp, #0x10
    mov r5, r4
    mov r6, r4
    mov r3, #0x4
.L_3f0:
    ldrb r2, [lr]
    ldrb r0, [lr, #0x1]
    add lr, lr, #0x2
    strb r2, [ip]
    strb r0, [ip, #0x1]
    add ip, ip, #0x2
    subs r3, r3, #0x1
    bne .L_3f0
    cmp r1, #0x0
    beq .L_424
    cmp r1, #0x1
    beq .L_448
    b .L_468
.L_424:
    ldr r0, _LIT1
    mov r4, #0x78
    ldrh r0, [r0, #0x54]
    ldr r6, _LIT2
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    b .L_468
.L_448:
    ldr r0, _LIT1
    ldr r6, _LIT3
    ldrh r0, [r0, #0x54]
    mov r4, #0xdc
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
.L_468:
    bl func_0208dd64
    add r4, r0, r4, lsl #0x5
    mov r1, r4
    mov r0, #0x0
    mov r2, #0xc80
    bl func_02094410
    ldr r0, _LIT4
    mov r1, #0x14
    mov r2, #0x5
    bl func_02001cec
    mov r0, r6
    bl func_0202c06c
    mov r3, #0x4
    mov r1, r0
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT4
    mov r2, r4
    bl func_02004f3c
    mov r2, r5
    add r0, sp, #0x8
    add r1, sp, #0x10
    bl func_02091554
    add r0, sp, #0x8
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0xa0
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    mov r0, #0x14
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT4
    mov r2, r4
    add r1, sp, #0x8
    bl func_02004f3c
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov014_021b4af8
_LIT1: .word data_ov014_02234ff4
_LIT2: .word 0x000006a7
_LIT3: .word 0x000006a6
_LIT4: .word data_02102bb0
