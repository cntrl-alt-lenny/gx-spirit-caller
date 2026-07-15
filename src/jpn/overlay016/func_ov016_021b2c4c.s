; func_ov016_021b2c4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov016_021b8ea0
        .extern data_ov016_021b8eaa
        .extern data_ov016_021b8eb4
        .extern data_ov016_021baa8c
        .extern data_ov016_021baad8
        .extern data_ov016_021bab04
        .extern func_02006190
        .extern func_ov016_021b277c
        .extern func_ov016_021b298c
        .extern func_ov016_021b3398
        .extern func_ov016_021b38e4
        .extern func_ov016_021b40e8
        .extern func_ov016_021b5c7c
        .extern func_ov016_021b61fc
        .global func_ov016_021b2c4c
        .arm
func_ov016_021b2c4c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, _LIT0
    mov r4, #0x0
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_28
    bl func_ov016_021b5c7c
    mov r4, #0x1
.L_28:
    ldr r0, [r6, #0x4]
    cmp r0, #0x0
    beq .L_48
    cmp r0, #0x1
    beq .L_1e4
    cmp r0, #0x2
    beq .L_1f0
    b .L_1f8
.L_48:
    ldr r7, _LIT1
    mov r5, #0x3
    mov r0, r7
    bl func_ov016_021b277c
    cmp r0, #0x0
    beq .L_68
    cmp r4, #0x0
    moveq r5, #0x4
.L_68:
    mov r0, r6
    mov r2, r5
    mov r3, r7
    mov r1, #0x0
    bl func_ov016_021b3398
    ldr r7, _LIT2
    mov r8, #0x0
    mov r0, r7
    mov r5, #0x1
    bl func_ov016_021b277c
    cmp r0, #0x0
    beq .L_b8
    cmp r4, #0x0
    bne .L_b8
    mov r1, r8
    mov r0, r6
    str r1, [r6, #0xc]
    mov r8, r5
    bl func_ov016_021b38e4
    mov r5, #0x2
.L_b8:
    mov r0, r6
    mov r2, r8
    mov r3, r7
    mov r1, #0x0
    bl func_ov016_021b3398
    mov r1, #0x100
    ldr r0, _LIT3
    str r1, [sp]
    ldrh r1, [r0, #0xc]
    mov r3, r5
    mov r0, #0x0
    add r1, r1, #0x3
    mov r2, #0x288
    bl func_ov016_021b298c
    ldr r7, _LIT4
    mov r8, #0x0
    mov r0, r7
    mov r5, #0x1
    bl func_ov016_021b277c
    cmp r0, #0x0
    beq .L_128
    cmp r4, #0x0
    bne .L_128
    mov r8, r5
    mov r0, r6
    str r8, [r6, #0xc]
    bl func_ov016_021b38e4
    mov r5, #0x2
.L_128:
    mov r0, r6
    mov r2, r8
    mov r3, r7
    mov r1, #0x0
    bl func_ov016_021b3398
    mov r1, #0x100
    ldr r0, _LIT3
    str r1, [sp]
    ldrh r1, [r0, #0x16]
    mov r3, r5
    mov r0, #0x0
    add r1, r1, #0x3
    mov r2, #0x298
    bl func_ov016_021b298c
    bl func_02006190
    cmp r0, #0x0
    cmpeq r4, #0x0
    bne .L_1c4
    ldr r1, [r6, #0xc]
    mov r0, #0xa
    add r1, r1, #0x1
    mul r0, r1, r0
    ldr r1, _LIT1
    add r3, sp, #0x4
    add r2, r1, r0
    ldrh r1, [r1, r0]
    ldrh r0, [r2, #0x2]
    ldrh r5, [r2, #0x8]
    ldrh r4, [r2, #0x6]
    sub lr, r1, #0x3
    sub ip, r0, #0x3
    mov r0, r6
    mov r1, #0x0
    mov r2, #0x2
    strh lr, [sp, #0x4]
    strh ip, [sp, #0x6]
    strh r5, [sp, #0xc]
    strh r4, [sp, #0xa]
    bl func_ov016_021b3398
.L_1c4:
    mov r4, #0xc0
    mov r0, #0x20
    mov r1, #0xa
    mov r2, #0x27c
    mov r3, #0x3
    str r4, [sp]
    bl func_ov016_021b298c
    b .L_1f8
.L_1e4:
    ldr r0, _LIT5
    bl func_ov016_021b40e8
    b .L_1f8
.L_1f0:
    ldr r0, _LIT6
    bl func_ov016_021b61fc
.L_1f8:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov016_021baad8
_LIT1: .word data_ov016_021b8ea0
_LIT2: .word data_ov016_021b8eaa
_LIT3: .word data_ov016_021b8ea0
_LIT4: .word data_ov016_021b8eb4
_LIT5: .word data_ov016_021baa8c
_LIT6: .word data_ov016_021bab04
