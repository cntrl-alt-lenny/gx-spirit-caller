; func_ov002_0227aa80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022d0250
        .extern func_ov002_021bb068
        .extern func_ov002_02254a2c
        .extern func_ov002_0227a8fc
        .global func_ov002_0227aa80
        .arm
func_ov002_0227aa80:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r3
    cmp r2, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, [sp, #0x10]
    ldr ip, [r0]
    and r3, r6, #0x1
    bic ip, ip, #0x1
    orr r3, ip, r3
    bic r3, r3, #0x1e
    mov r2, r2, lsl #0x1c
    orr r2, r3, r2, lsr #0x1b
    cmp r1, #0x0
    orrne r1, r2, #0x20
    bicne r1, r1, #0xc0
    biceq r1, r2, #0x20
    biceq r1, r1, #0xc0
    str r2, [r0]
    orreq r1, r1, #0x40
    str r1, [r0]
    ldr r0, _LIT1
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_7c
    ldr r0, _LIT0
    ldr r1, [r0]
    orr r1, r1, #0x20
    str r1, [r0]
.L_7c:
    cmp r4, #0x0
    bne .L_94
    ldr r0, _LIT0
    mov r1, #0x0
    strb r1, [r0, #0x8]
    strb r1, [r0, #0x9]
.L_94:
    ldr r0, _LIT2
    mov r2, r5, lsl #0x2
    ldrh r2, [r0, r2]
    ldr r1, _LIT0
    ldr r0, _LIT3
    ldr r3, [r1]
    mov r2, r2, lsl #0x13
    and r3, r3, r0
    mov r2, r2, lsr #0x13
    orr r3, r3, r5, lsl #0x17
    rsb r0, r0, #0xfe
    and r3, r3, r0
    mov r0, r2, lsl #0x11
    orr r0, r3, r0, lsr #0x9
    str r0, [r1]
    ldrh r2, [r1, #0x16]
    mov r0, #0x0
    bic r2, r2, #0x700
    orr r2, r2, #0x100
    strh r2, [r1, #0x16]
    strh r0, [r1, #0x4]
    ldrb r0, [r1, #0x8]
    cmp r0, #0x0
    ldrneh r0, [r1, #0x4]
    orrne r0, r0, #0x1
    strneh r0, [r1, #0x4]
    mov r0, r6
    bl func_ov002_02254a2c
    bl func_ov002_0227a8fc
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word 0x0000135d
_LIT2: .word data_ov002_022d0250
_LIT3: .word 0x007fffff
