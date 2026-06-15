; func_0206292c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101530
        .extern func_02062280
        .extern func_02064490
        .global func_0206292c
        .arm
func_0206292c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r3, _LIT0
    mov r4, r0
    ldrb ip, [r3]
    ldrb r3, [r3, #0x1]
    add r0, sp, #0x0
    mov r7, r1
    strb ip, [r0]
    mov r6, r2
    strb r3, [r0, #0x1]
    mov r3, #0x65
    mov r2, r7
    mov r5, #0x0
    mov r1, #0x3
    strb r3, [sp, #0x2]
    bl func_02064490
    cmp r7, r6
    add r5, r5, #0x5
    beq .L_64
    add r0, sp, #0x0
    mov r1, r5
    mov r2, r6
    bl func_02064490
    add r5, r5, #0x2
.L_64:
    add r1, sp, #0x0
    mov r0, r4
    mov r2, r5
    bl func_02062280
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02101530
