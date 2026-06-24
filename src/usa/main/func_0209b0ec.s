; func_0209b0ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a82f0
        .extern data_021a82f4
        .extern func_0209a990
        .extern func_0209acc0
        .extern func_0209b3f0
        .global func_0209b0ec
        .arm
func_0209b0ec:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_0209b3f0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r0, _LIT1
    str r2, [r1]
    bl func_0209acc0
    ldr r1, _LIT0
.L_40:
    ldr r0, [r1]
    cmp r0, #0x0
    beq .L_40
    mov r0, #0x0
    ldr ip, _LIT2
    str r0, [r1]
    mov r2, r0
    mov r3, r0
    mov r1, #0x2
    str r0, [ip]
    bl func_0209a990
    ldr r0, _LIT3
    and r1, r5, #0xff
    orr r0, r1, r0
    bl func_0209acc0
    ldr r0, _LIT4
    ldr r1, _LIT5
    and r0, r4, r0
    orr r0, r0, r1
    bl func_0209acc0
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a82f0
_LIT1: .word 0x03006000
_LIT2: .word data_021a82f4
_LIT3: .word 0x02006100
_LIT4: .word 0x0000ffff
_LIT5: .word 0x01010000
