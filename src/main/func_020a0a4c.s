; func_020a0a4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a98fc
        .extern func_0209448c
        .extern func_020a0bd8
        .extern func_020a0f38
        .extern func_020a10e8
        .global func_020a0a4c
        .arm
func_020a0a4c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    add r1, sp, #0x0
    mov r0, #0x0
    mov r2, #0xa
    bl func_0209448c
    mov ip, #0x1
    ldr r0, _LIT0
    mov r4, ip
    ldr r3, [r0]
    mov r5, ip
    mov r0, ip
    mov r1, ip
    mov r2, ip
.L_bc:
    sub lr, ip, #0x1
    add lr, r3, lr, lsl #0x2
    add lr, lr, #0x1000
    ldr lr, [lr, #0x4e8]
    cmp lr, #0xb
    addls pc, pc, lr, lsl #0x2
    b .L_154
    b .L_154
    b .L_154
    b .L_108
    b .L_154
    b .L_128
    b .L_118
    b .L_154
    b .L_154
    b .L_138
    b .L_154
    b .L_154
    b .L_148
.L_108:
    ldrh lr, [sp]
    orr lr, lr, r2, lsl ip
    strh lr, [sp]
    b .L_154
.L_118:
    ldrh lr, [sp, #0x2]
    orr lr, lr, r1, lsl ip
    strh lr, [sp, #0x2]
    b .L_154
.L_128:
    ldrh lr, [sp, #0x4]
    orr lr, lr, r0, lsl ip
    strh lr, [sp, #0x4]
    b .L_154
.L_138:
    ldrh lr, [sp, #0x6]
    orr lr, lr, r5, lsl ip
    strh lr, [sp, #0x6]
    b .L_154
.L_148:
    ldrh lr, [sp, #0x8]
    orr lr, lr, r4, lsl ip
    strh lr, [sp, #0x8]
.L_154:
    add ip, ip, #0x1
    mov ip, ip, lsl #0x10
    mov ip, ip, lsr #0x10
    cmp ip, #0xf
    bls .L_bc
    ldrh r1, [sp, #0x6]
    cmp r1, #0x0
    beq .L_180
    mov r0, #0x5
    bl func_020a10e8
    b .L_1e0
.L_180:
    ldrh r1, [sp]
    cmp r1, #0x0
    beq .L_198
    mov r0, #0x1
    bl func_020a10e8
    b .L_1e0
.L_198:
    ldrh r1, [sp, #0x8]
    cmp r1, #0x0
    beq .L_1b0
    mov r0, #0x6
    bl func_020a10e8
    b .L_1e0
.L_1b0:
    ldrh r1, [sp, #0x4]
    cmp r1, #0x0
    beq .L_1c8
    mov r0, #0x2
    bl func_020a10e8
    b .L_1e0
.L_1c8:
    ldrh r0, [sp, #0x2]
    cmp r0, #0x0
    beq .L_1dc
    bl func_020a0f38
    b .L_1e0
.L_1dc:
    bl func_020a0bd8
.L_1e0:
    cmp r0, #0x15
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    ldr r1, _LIT1
    mov r0, #0x0
    bl func_020a10e8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a98fc
_LIT1: .word 0x0000ffff
