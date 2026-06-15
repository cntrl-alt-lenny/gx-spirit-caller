; func_02010b08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218cbc8
        .extern data_0218fcc8
        .extern func_0200fb18
        .extern func_0200fd1c
        .extern func_0200fdfc
        .extern func_020101b4
        .extern func_02010354
        .extern func_02010eb4
        .extern func_02090048
        .extern func_020900a0
        .extern func_02090114
        .extern func_0209015c
        .extern func_020901cc
        .extern func_02090330
        .extern func_02092904
        .global func_02010b08
        .arm
func_02010b08:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldrh r0, [r0, #0x44]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    add r0, r4, #0x3100
    ldrh r2, [r0, #0x40]
    ldrh r0, [r0, #0x42]
    cmp r0, r2
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    add r1, r4, #0x1940
    mov r0, #0x18
    mla r5, r2, r0, r1
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_1068
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq .L_db8
    cmp r0, #0x1
    beq .L_f2c
    b .L_105c
.L_db8:
    ldr r0, [r5, #0xc]
    ldr r6, [r5]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_eac
    mov r0, r6
    bl func_0200fb18
    movs r1, r0
    beq .L_e10
    ldr r0, [r5, #0xc]
    movs r0, r0, lsr #0x1f
    beq .L_1068
    mov r2, #0x0
    mov r0, r6
    mov r3, r2
    str r2, [sp]
    bl func_0200fdfc
    cmp r0, #0x0
    bne .L_1068
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_e10:
    ldr r2, [r5, #0x8]
    ldr r1, [r2, #0x7c]
    mov r0, r1, lsl #0x5
    movs r0, r0, lsr #0x1f
    beq .L_e5c
    ldr r0, [r2, #0x18]
    ldr ip, [r2, #0x260]
    sub r3, r6, r0
    mov r0, r3, asr #0x4
    add r0, r3, r0, lsr #0x1b
    cmp ip, r0, asr #0x5
    bne .L_e5c
    ldr r3, [r5, #0xc]
    ldr r0, [r2, #0x25c]
    mov r3, r3, lsl #0x2
    movs r3, r3, lsr #0x1f
    bicne r1, r1, #0x4000000
    strne r1, [r2, #0x7c]
    b .L_e64
.L_e5c:
    mov r0, r6
    bl func_020101b4
.L_e64:
    cmp r0, #0x80000
    bne .L_e74
    bl func_02010eb4
.L_e70:
    b .L_e70
.L_e74:
    str r0, [r6, #0x18]
    ldr r0, [r5, #0xc]
    movs r0, r0, lsr #0x1f
    beq .L_eac
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    mov r3, r1
    str r1, [sp]
    bl func_0200fdfc
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
.L_eac:
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x14]
    bl func_02092904
    bl func_02090330
    ldr r0, [r5, #0xc]
    mov r1, r0, lsl #0x1
    movs r1, r1, lsr #0x1f
    beq .L_f0c
    ldr r0, [r6, #0x18]
    cmp r0, #0x20000
    bcs .L_ef0
    mov r1, r0, lsr #0x1
    ldr r0, [r5, #0x10]
    ldr r2, [r5, #0x14]
    add r1, r1, #0x20000
    bl func_020901cc
    b .L_f24
.L_ef0:
    sub r0, r0, #0x40000
    mov r1, r0, lsr #0x1
    ldr r0, [r5, #0x10]
    ldr r2, [r5, #0x14]
    add r1, r1, #0x30000
    bl func_020901cc
    b .L_f24
.L_f0c:
    ldr r3, [r6, #0x18]
    mov r1, r0, lsl #0x9
    ldr r0, [r5, #0x10]
    ldr r2, [r5, #0x14]
    add r1, r3, r1, lsr #0xa
    bl func_020901cc
.L_f24:
    bl func_0209015c
    b .L_1068
.L_f2c:
    ldr r0, [r5, #0xc]
    ldr r6, [r5]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_1028
    mov r0, r6
    bl func_0200fd1c
    movs r1, r0
    beq .L_f84
    ldr r0, [r5, #0xc]
    movs r0, r0, lsr #0x1f
    beq .L_1068
    mov r3, #0x0
    mov r0, r6
    mov r2, #0x1
    str r3, [sp]
    bl func_0200fdfc
    cmp r0, #0x0
    bne .L_1068
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_f84:
    ldr r2, [r5, #0x8]
    ldr r1, [r2, #0x7c]
    mov r0, r1, lsl #0x4
    movs r0, r0, lsr #0x1f
    beq .L_fd8
    ldr r0, [r2, #0x1c]
    ldr r3, _LIT2
    sub ip, r6, r0
    smull r0, lr, r3, ip
    mov r0, ip, lsr #0x1f
    ldr r3, [r2, #0x268]
    add lr, r0, lr, asr #0x1
    cmp r3, lr
    bne .L_fd8
    ldr r3, [r5, #0xc]
    ldr r0, [r2, #0x264]
    mov r3, r3, lsl #0x2
    movs r3, r3, lsr #0x1f
    bicne r1, r1, #0x8000000
    strne r1, [r2, #0x7c]
    b .L_fe0
.L_fd8:
    mov r0, r6
    bl func_02010354
.L_fe0:
    cmp r0, #0x80000
    bne .L_ff0
    bl func_02010eb4
.L_fec:
    b .L_fec
.L_ff0:
    str r0, [r6, #0x8]
    ldr r0, [r5, #0xc]
    movs r0, r0, lsr #0x1f
    beq .L_1028
    mov r1, #0x0
    mov r0, r6
    mov r3, r1
    mov r2, #0x1
    str r1, [sp]
    bl func_0200fdfc
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
.L_1028:
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x14]
    bl func_02092904
    bl func_02090114
    ldr r0, [r5, #0xc]
    ldr r3, [r6, #0x8]
    mov r1, r0, lsl #0x9
    ldr r0, [r5, #0x10]
    ldr r2, [r5, #0x14]
    add r1, r3, r1, lsr #0xa
    bl func_020900a0
    bl func_02090048
    b .L_1068
.L_105c:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_1068:
    add r0, r4, #0x3100
    ldrh r1, [r0, #0x44]
    sub r1, r1, #0x1
    strh r1, [r0, #0x44]
    ldr r2, [r5, #0x8]
    cmp r2, #0x0
    beq .L_10bc
    ldr r1, [r2, #0x60]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x1b
    sub r0, r0, #0x1
    bic r1, r1, #0x3e000000
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x2
    str r0, [r2, #0x60]
    ldr r2, [r5, #0x8]
    ldr r0, [r2, #0x60]
    mov r1, r0, lsl #0x2
    movs r1, r1, lsr #0x1b
    biceq r0, r0, #0x2
    streq r0, [r2, #0x60]
.L_10bc:
    add r0, r4, #0x3100
    ldrh r1, [r0, #0x40]
    add r1, r1, #0x1
    strh r1, [r0, #0x40]
    ldrh r1, [r0, #0x40]
    cmp r1, #0x100
    movcs r1, #0x0
    strcsh r1, [r0, #0x40]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_0218fcc8
_LIT1: .word data_0218cbc8
_LIT2: .word 0x2aaaaaab
