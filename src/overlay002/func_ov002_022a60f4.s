; func_ov002_022a60f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .global func_ov002_022a60f4
        .arm
func_ov002_022a60f4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    cmp r2, #0x10
    bcc .L_7b8
    ldr r1, _LIT0
    ldrh lr, [sp, #0x6]
    ldr r1, [r1, #0x4]
    mov r3, #0xcc
    mul r4, r1, r3
    mov ip, r1, lsl #0x10
    mov ip, ip, lsr #0x10
    add r3, r0, r4
    ldr r3, [r3, #0x484]
    bic lr, lr, #0x1
    and ip, ip, #0x1
    orr ip, lr, ip
    strh ip, [sp, #0x6]
    ldrh ip, [sp, #0x6]
    add lr, r0, r4
    cmp r3, #0x8
    bic ip, ip, #0x3e
    movge r3, #0x8
    orr ip, ip, #0x16
    ldr lr, [lr, #0x488]
    add r3, r3, r3, lsr #0x1f
    strh ip, [sp, #0x6]
    add r3, lr, r3, asr #0x1
    ldrh lr, [sp, #0x6]
    mov ip, r3, lsl #0x10
    mov ip, ip, lsr #0x10
    bic lr, lr, #0x3fc0
    mov ip, ip, lsl #0x18
    orr ip, lr, ip, lsr #0x12
    strh ip, [sp, #0x6]
    ldrh lr, [sp, #0x6]
    add ip, r0, #0x500
    bic lr, lr, #0x4000
    strh lr, [sp, #0x6]
    ldrh lr, [sp, #0x6]
    bic lr, lr, #0x8000
    strh lr, [sp, #0x6]
    ldrh lr, [sp, #0x6]
    strh lr, [ip, #0x90]
    b .L_8ac
.L_7b8:
    cmp r2, #0x4
    bgt .L_834
    cmp r3, #0x10
    bcc .L_834
    ldrh lr, [sp, #0x4]
    mov ip, r1, lsl #0x10
    mov ip, ip, lsr #0x10
    bic lr, lr, #0x1
    and ip, ip, #0x1
    orr ip, lr, ip
    strh ip, [sp, #0x4]
    ldrh lr, [sp, #0x4]
    mov ip, r2, lsl #0x10
    mov ip, ip, lsr #0x10
    bic lr, lr, #0x3e
    mov ip, ip, lsl #0x1b
    orr ip, lr, ip, lsr #0x1a
    strh ip, [sp, #0x4]
    ldrh lr, [sp, #0x4]
    add ip, r0, #0x500
    bic lr, lr, #0x3fc0
    strh lr, [sp, #0x4]
    ldrh lr, [sp, #0x4]
    bic lr, lr, #0x4000
    strh lr, [sp, #0x4]
    ldrh lr, [sp, #0x4]
    bic lr, lr, #0x8000
    strh lr, [sp, #0x4]
    ldrh lr, [sp, #0x4]
    strh lr, [ip, #0x90]
    b .L_8ac
.L_834:
    ldrh lr, [sp, #0x2]
    mov ip, r1, lsl #0x10
    mov ip, ip, lsr #0x10
    bic lr, lr, #0x1
    and ip, ip, #0x1
    orr ip, lr, ip
    strh ip, [sp, #0x2]
    ldrh lr, [sp, #0x2]
    mov ip, r2, lsl #0x10
    mov ip, ip, lsr #0x10
    bic lr, lr, #0x3e
    mov ip, ip, lsl #0x1b
    orr ip, lr, ip, lsr #0x1a
    strh ip, [sp, #0x2]
    ldrh lr, [sp, #0x2]
    mov ip, r3, lsl #0x10
    mov ip, ip, lsr #0x10
    bic lr, lr, #0x3fc0
    mov ip, ip, lsl #0x18
    orr ip, lr, ip, lsr #0x12
    strh ip, [sp, #0x2]
    ldrh lr, [sp, #0x2]
    add ip, r0, #0x500
    orr lr, lr, #0x4000
    strh lr, [sp, #0x2]
    ldrh lr, [sp, #0x2]
    bic lr, lr, #0x8000
    strh lr, [sp, #0x2]
    ldrh lr, [sp, #0x2]
    strh lr, [ip, #0x90]
.L_8ac:
    ldrh ip, [sp]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic ip, ip, #0x1
    and r1, r1, #0x1
    orr r1, ip, r1
    strh r1, [sp]
    ldrh ip, [sp]
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, ip, #0x3e
    mov r1, r1, lsl #0x1b
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp]
    ldrh r2, [sp]
    mov r1, r3, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0x3fc0
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x12
    strh r1, [sp]
    ldrh r1, [sp]
    add r0, r0, #0x500
    bic r1, r1, #0x4000
    strh r1, [sp]
    ldrh r1, [sp]
    bic r1, r1, #0x8000
    strh r1, [sp]
    ldrh r1, [sp]
    strh r1, [r0, #0x92]
    ldrh r1, [r0, #0x90]
    strh r1, [r0, #0x94]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd73c
