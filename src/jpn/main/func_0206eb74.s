; func_0206eb74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ec70
        .extern data_0219ec7c
        .extern data_0219ec84
        .extern data_0219ecdc
        .extern func_0206e210
        .extern func_02094500
        .extern func_020a69a0
        .global func_0206eb74
        .arm
func_0206eb74:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_0206e210
    movs r4, r0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r0, _LIT0
    ldr r2, _LIT1
    mov r1, #0x0
    bl func_02094500
    ldr r0, _LIT0
    ldr r2, _LIT1
    mov r1, r5
    bl func_020a69a0
    mov r1, r4, lsr #0x18
    mov r0, r4, lsr #0x8
    mov r2, r4, lsl #0x8
    mov r3, r4, lsl #0x18
    and r1, r1, #0xff
    and r0, r0, #0xff00
    and r2, r2, #0xff0000
    orr r0, r1, r0
    and r3, r3, #-16777216
    orr r1, r2, r0
    ldr r5, _LIT0
    ldr r0, _LIT2
    ldr ip, _LIT3
    mov r4, #0x0
    ldr r2, _LIT4
    orr r1, r3, r1
    mov lr, #0x2
    mov r3, #0x4
    str r5, [r0]
    str r4, [r0, #0x4]
    strh lr, [r0, #0x8]
    strh r3, [r0, #0xa]
    str ip, [r0, #0xc]
    str r2, [ip]
    str r4, [ip, #0x4]
    str r1, [r2]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_0219ecdc
_LIT1: .word 0x00000101
_LIT2: .word data_0219ec84
_LIT3: .word data_0219ec7c
_LIT4: .word data_0219ec70
