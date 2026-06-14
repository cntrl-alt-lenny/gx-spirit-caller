; func_ov011_021cca04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_ov011_021d2fc8
        .extern data_ov011_021d2fc9
        .extern data_ov011_021d4000
        .extern data_ov011_021d403c
        .global func_ov011_021cca04
        .arm
func_ov011_021cca04:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    mov r7, #0x0
    ldr r0, [r0, #0x2a0]
    ldr r4, _LIT1
    cmp r0, #0x0
    ldrne r0, [r4, #0x268]
    moveq r3, #0x0
    movne r0, r0, lsl #0x17
    movne r3, r0, lsr #0x1c
    ldr r1, _LIT2
    ldr r0, _LIT3
    ldrb r2, [r1, r3, lsl #0x1]
    ldrb r1, [r0, r3, lsl #0x1]
    ldr r0, [r4, #0x264]
    mov r8, r7
    cmp r0, #0x1
    mov r5, r2, lsl #0x3
    mov r6, r1, lsl #0x3
    bne .L_78
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1c
    cmp r0, #0x5
    bne .L_78
    bl GetSystemWork
    ldr r0, [r0, #0x8f8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x1f
    moveq r8, #0xe8
.L_78:
    ldr r0, [r4, #0x1fc]
    sub r1, r5, #0x100
    cmp r0, r1, lsl #0xc
    mov r1, r1, lsl #0xc
    strgt r1, [r4, #0x1fc]
    bgt .L_9c
    cmp r0, r7, lsl #0xc
    mov r0, r7, lsl #0xc
    strlt r0, [r4, #0x1fc]
.L_9c:
    ldr r0, [r4, #0x200]
    sub r1, r6, #0xc0
    cmp r0, r1, lsl #0xc
    mov r1, r1, lsl #0xc
    strgt r1, [r4, #0x200]
    ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r0, r8, lsl #0xc
    mov r0, r8, lsl #0xc
    strlt r0, [r4, #0x200]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov011_021d4000
_LIT1: .word data_ov011_021d403c
_LIT2: .word data_ov011_021d2fc8
_LIT3: .word data_ov011_021d2fc9
