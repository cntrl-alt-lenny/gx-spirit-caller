; func_02073fc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02073fc8
        .arm
func_02073fc8:
    ands r3, r0, #0x1
    beq .L_38
    cmp r1, #0x1
    bls .L_8c
.L_10:
    ldrb ip, [r0]
    ldrb r3, [r0, #0x1]
    sub r1, r1, #0x2
    cmp r1, #0x1
    orr r3, r3, ip, lsl #0x8
    mov r3, r3, lsl #0x10
    add r2, r2, r3, lsr #0x10
    add r0, r0, #0x2
    bhi .L_10
    b .L_8c
.L_38:
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r2, r3, asr #0x8
    orr r2, r2, r3, lsl #0x8
    mov r2, r2, lsl #0x10
    cmp r1, #0x1
    mov r2, r2, lsr #0x10
    bls .L_70
.L_58:
    ldrh r3, [r0]
    sub r1, r1, #0x2
    cmp r1, #0x1
    add r2, r2, r3
    add r0, r0, #0x2
    bhi .L_58
.L_70:
    ldr r3, _LIT0
    ldr ip, _LIT1
    and r3, r3, r2, lsr #0x8
    and r2, ip, r2, lsl #0x8
    orr r3, r3, r2
    mov r2, r3, lsr #0x10
    orr r2, r2, r3, lsl #0x10
.L_8c:
    cmp r1, #0x0
    ldrneb r0, [r0]
    addne r2, r2, r0, lsl #0x8
    ldr r0, _LIT2
    and r0, r2, r0
    add r0, r0, r2, lsr #0x10
    add r0, r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bx lr
_LIT0: .word 0x00ff00ff
_LIT1: .word 0xff00ff00
_LIT2: .word 0x0000ffff
