; func_020a0958 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a981c
        .extern func_02094398
        .extern func_020a0ae4
        .extern func_020a0e44
        .extern func_020a0ff4
        .global func_020a0958
        .arm
func_020a0958:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    add r1, sp, #0x0
    mov r0, #0x0
    mov r2, #0xa
    bl func_02094398
    mov ip, #0x1
    ldr r0, _LIT0
    mov r4, ip
    ldr r3, [r0]
    mov r5, ip
    mov r0, ip
    mov r1, ip
    mov r2, ip
.L_38:
    sub lr, ip, #0x1
    add lr, r3, lr, lsl #0x2
    add lr, lr, #0x1000
    ldr lr, [lr, #0x4e8]
    cmp lr, #0xb
    addls pc, pc, lr, lsl #0x2
    b .L_d0
    b .L_d0
    b .L_d0
    b .L_84
    b .L_d0
    b .L_a4
    b .L_94
    b .L_d0
    b .L_d0
    b .L_b4
    b .L_d0
    b .L_d0
    b .L_c4
.L_84:
    ldrh lr, [sp]
    orr lr, lr, r2, lsl ip
    strh lr, [sp]
    b .L_d0
.L_94:
    ldrh lr, [sp, #0x2]
    orr lr, lr, r1, lsl ip
    strh lr, [sp, #0x2]
    b .L_d0
.L_a4:
    ldrh lr, [sp, #0x4]
    orr lr, lr, r0, lsl ip
    strh lr, [sp, #0x4]
    b .L_d0
.L_b4:
    ldrh lr, [sp, #0x6]
    orr lr, lr, r5, lsl ip
    strh lr, [sp, #0x6]
    b .L_d0
.L_c4:
    ldrh lr, [sp, #0x8]
    orr lr, lr, r4, lsl ip
    strh lr, [sp, #0x8]
.L_d0:
    add ip, ip, #0x1
    mov ip, ip, lsl #0x10
    mov ip, ip, lsr #0x10
    cmp ip, #0xf
    bls .L_38
    ldrh r1, [sp, #0x6]
    cmp r1, #0x0
    beq .L_fc
    mov r0, #0x5
    bl func_020a0ff4
    b .L_15c
.L_fc:
    ldrh r1, [sp]
    cmp r1, #0x0
    beq .L_114
    mov r0, #0x1
    bl func_020a0ff4
    b .L_15c
.L_114:
    ldrh r1, [sp, #0x8]
    cmp r1, #0x0
    beq .L_12c
    mov r0, #0x6
    bl func_020a0ff4
    b .L_15c
.L_12c:
    ldrh r1, [sp, #0x4]
    cmp r1, #0x0
    beq .L_144
    mov r0, #0x2
    bl func_020a0ff4
    b .L_15c
.L_144:
    ldrh r0, [sp, #0x2]
    cmp r0, #0x0
    beq .L_158
    bl func_020a0e44
    b .L_15c
.L_158:
    bl func_020a0ae4
.L_15c:
    cmp r0, #0x15
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    ldr r1, _LIT1
    mov r0, #0x0
    bl func_020a0ff4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a981c
_LIT1: .word 0x0000ffff
