; func_ov002_0227adcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022d0250
        .extern func_ov002_021b9aa8
        .extern func_ov002_02254a2c
        .extern func_ov002_0227a8fc
        .global func_ov002_0227adcc
        .arm
func_ov002_0227adcc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    cmp r2, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    ldr ip, [sp, #0x10]
    ldr r5, [r0]
    and lr, r4, #0x1
    bic r5, r5, #0x1
    orr r5, r5, lr
    bic lr, r5, #0x1e
    mov r2, r2, lsl #0x1c
    orr r2, lr, r2, lsr #0x1b
    orr r2, r2, #0x20
    bic lr, r2, #0xc0
    mov r2, r3, lsl #0x1e
    orr r2, lr, r2, lsr #0x18
    str r2, [r0]
    cmp ip, #0x0
    moveq r2, #0x0
    streqb r2, [r0, #0x9]
    streqb r2, [r0, #0x8]
    ldr r2, _LIT0
    ldr r0, _LIT1
    mov r3, r1, lsl #0x2
    ldrh r3, [r0, r3]
    ldr r0, _LIT2
    ldr ip, [r2]
    mov r3, r3, lsl #0x13
    and ip, ip, r0
    mov r3, r3, lsr #0x13
    orr ip, ip, r1, lsl #0x17
    rsb r0, r0, #0xfe
    and ip, ip, r0
    mov r0, r3, lsl #0x11
    orr r0, ip, r0, lsr #0x9
    str r0, [r2]
    ldrh ip, [r2, #0x16]
    mov r3, #0x4
    mov r0, r0, lsl #0x9
    bic ip, ip, #0x700
    orr ip, ip, #0x400
    strh ip, [r2, #0x16]
    mov ip, r0, lsr #0x11
    ldr r0, _LIT3
    strh ip, [r2, #0x6]
    cmp ip, r0
    ldrne r0, _LIT4
    orr r3, r3, #0x1
    strh r3, [r2, #0x4]
    cmpne ip, r0
    bne .L_e0
    ldr r0, _LIT0
    ldrh r2, [r0, #0x4]
    orr r2, r2, #0x10
    strh r2, [r0, #0x4]
.L_e0:
    mov r0, r4
    bl func_ov002_021b9aa8
    cmp r0, #0x0
    blt .L_f8
    mov r0, r4
    bl func_ov002_02254a2c
.L_f8:
    bl func_ov002_0227a8fc
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022d0250
_LIT2: .word 0x007fffff
_LIT3: .word 0x00001578
_LIT4: .word 0x00001a92
