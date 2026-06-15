; func_0209a3f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02099d80
        .global func_0209a3f8
        .arm
func_0209a3f8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    ldr ip, _LIT0
    mov r4, r0
    ldrh r1, [ip, #0x58]
    ldrh r2, [ip, #0x5a]
    ldrb r3, [ip, #0x5c]
    cmp r1, #0x0
    ldrb lr, [ip, #0x5d]
    ldrh r6, [ip, #0x5e]
    ldrh r5, [ip, #0x60]
    ldrb r0, [ip, #0x62]
    ldrb ip, [ip, #0x63]
    bne .L_448
    cmp r6, #0x0
    bne .L_448
    cmp r2, #0x0
    bne .L_448
    cmp r5, #0x0
    beq .L_46c
.L_448:
    str lr, [sp]
    str r6, [sp, #0x4]
    str r5, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, r4
    str ip, [sp, #0x10]
    bl func_02099d80
    cmp r0, #0x0
    beq .L_490
.L_46c:
    mov r0, #0x0
    strh r0, [r4]
    strh r0, [r4, #0x2]
    strh r0, [r4, #0x4]
    strh r0, [r4, #0x6]
    add sp, sp, #0x18
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_490:
    mov r0, #0x1
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x027ffc80
