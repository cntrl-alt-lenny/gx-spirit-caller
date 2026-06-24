; func_02009e80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e5c
        .extern data_02104e6c
        .extern data_0210585c
        .extern func_02009a94
        .global func_02009e80
        .arm
func_02009e80:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    mov r5, #0x0
    ldr r0, [r0, #0xa74]
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    sub r0, r0, #0x1
    cmp r0, #0x2
    bne .L_54
    ldr r0, _LIT1
    ldrh r0, [r0, #0xa0]
    cmp r0, #0x0
    beq .L_48
    cmp r0, #0x1
    beq .L_50
    cmp r0, #0x2
    moveq r5, #0x14
    b .L_54
.L_48:
    mov r5, #0x5
    b .L_54
.L_50:
    mov r5, #0xa
.L_54:
    mov r4, #0x0
    ldr r6, _LIT2
    mov r7, #0x32
    mov r8, r4
.L_64:
    add r0, r6, #0x1000
    ldrb r1, [r0, #0x56e]
    ldrb r2, [r0, #0x56d]
    add r1, r5, r1
    add r1, r2, r1
    strb r1, [r0, #0x56d]
    strb r8, [r0, #0x56e]
    ldrb r1, [r0, #0x56d]
    cmp r1, #0x32
    strhib r7, [r0, #0x56d]
    add r0, r4, #0x1
    bl func_02009a94
    add r4, r4, #0x1
    cmp r4, #0x1a
    add r6, r6, #0x1c
    blt .L_64
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02104e5c
_LIT1: .word data_0210585c
_LIT2: .word data_02104e6c
