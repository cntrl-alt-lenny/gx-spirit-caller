; func_0204b130 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff8a0
        .extern data_020ff8a8
        .extern data_020ff8b4
        .extern data_020ff8c0
        .extern data_020ff8cc
        .extern data_020ff8d8
        .extern func_020689ac
        .global func_0204b130
        .arm
func_0204b130:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mvn r2, #0x0
    mov r4, r0
    bl func_020689ac
    mvn r2, #0x0
    cmp r0, r2
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT1
    mov r0, r4
    bl func_020689ac
    mvn r2, #0x0
    cmp r0, r2
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT2
    mov r0, r4
    bl func_020689ac
    mvn r2, #0x0
    cmp r0, r2
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT3
    mov r0, r4
    bl func_020689ac
    mvn r1, #0x0
    cmp r0, r1
    bne .L_90
    ldr r1, _LIT3
    mov r0, r4
    mov r2, #0x0
    bl func_020689ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_90:
    ldr r1, _LIT4
    mov r0, r4
    mvn r2, #0x0
    bl func_020689ac
    mvn r1, #0x0
    cmp r0, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT5
    mov r0, r4
    mov r2, #0x0
    bl func_020689ac
    ldmia sp!, {r4, pc}
_LIT0: .word data_020ff8a8
_LIT1: .word data_020ff8b4
_LIT2: .word data_020ff8c0
_LIT3: .word data_020ff8cc
_LIT4: .word data_020ff8d8
_LIT5: .word data_020ff8a0
