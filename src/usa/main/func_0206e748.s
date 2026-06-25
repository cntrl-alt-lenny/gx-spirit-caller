; func_0206e748 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ec74
        .extern data_0219ec78
        .extern data_0219eca4
        .extern func_0206bcbc
        .extern func_0206e8cc
        .extern func_0206e90c
        .global func_0206e748
        .arm
func_0206e748:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r1, [r0, #0xc]
    ldr ip, _LIT0
    cmp r1, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    str r1, [ip]
    ldr r6, [r0, #0x10]
    ldr r5, _LIT1
    mov r2, r6, lsr #0x18
    mov r1, r6, lsr #0x8
    mov r3, r6, lsl #0x8
    and r2, r2, #0xff
    and r1, r1, #0xff00
    mov r6, r6, lsl #0x18
    orr r1, r2, r1
    and r3, r3, #0xff0000
    orr r1, r3, r1
    and r2, r6, #-16777216
    orr r1, r2, r1
    str r1, [ip, #0x4]
    ldr r7, [r0, #0x14]
    ldr r4, _LIT2
    mov r2, r7, lsr #0x18
    mov r1, r7, lsr #0x8
    mov r6, r7, lsl #0x8
    and r2, r2, #0xff
    and r1, r1, #0xff00
    mov r7, r7, lsl #0x18
    orr r1, r2, r1
    and r6, r6, #0xff0000
    and r2, r7, #-16777216
    orr r1, r6, r1
    orr r1, r2, r1
    str r1, [ip, #0x8]
    ldr r1, [r0, #0x18]
    ldr r3, _LIT3
    mov r7, r1, lsr #0x18
    mov r6, r1, lsr #0x8
    mov r8, r1, lsl #0x8
    and r7, r7, #0xff
    and r6, r6, #0xff00
    mov r1, r1, lsl #0x18
    orr r6, r7, r6
    and r8, r8, #0xff0000
    and r7, r1, #-16777216
    orr r1, r8, r6
    orr r1, r7, r1
    str r1, [ip, #0xc]
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT4
    mov r7, r1, lsr #0x18
    mov r6, r1, lsr #0x8
    mov r8, r1, lsl #0x8
    and r7, r7, #0xff
    and r6, r6, #0xff00
    mov r1, r1, lsl #0x18
    orr r6, r7, r6
    and r8, r8, #0xff0000
    and r7, r1, #-16777216
    orr r1, r8, r6
    orr r1, r7, r1
    str r1, [ip, #0x10]
    ldr r1, [r0, #0x20]
    mov lr, #0x40
    mov r7, r1, lsr #0x18
    mov r6, r1, lsr #0x8
    mov r8, r1, lsl #0x8
    and r7, r7, #0xff
    and r6, r6, #0xff00
    mov r1, r1, lsl #0x18
    orr r6, r7, r6
    and r8, r8, #0xff0000
    and r7, r1, #-16777216
    orr r1, r8, r6
    orr r1, r7, r1
    str r5, [ip, #0x18]
    str r4, [ip, #0x1c]
    str r1, [ip, #0x14]
    ldr r1, [r0, #0x4]
    str r1, [r3]
    ldr r1, [r0, #0x8]
    str lr, [ip, #0x20]
    str r1, [r2]
    ldr r1, [r0, #0x2c]
    str r1, [ip, #0x30]
    ldr r1, [r0, #0x30]
    mov r0, ip
    str r1, [ip, #0x34]
    bl func_0206bcbc
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_0219eca4
_LIT1: .word func_0206e90c
_LIT2: .word func_0206e8cc
_LIT3: .word data_0219ec78
_LIT4: .word data_0219ec74
