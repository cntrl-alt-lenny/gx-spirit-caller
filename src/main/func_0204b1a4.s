; func_0204b1a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff980
        .extern data_020ff988
        .extern data_020ff994
        .extern data_020ff9a0
        .extern data_020ff9ac
        .extern data_020ff9b8
        .extern func_02068a20
        .global func_0204b1a4
        .arm
func_0204b1a4:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mvn r2, #0x0
    mov r4, r0
    bl func_02068a20
    mvn r2, #0x0
    cmp r0, r2
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT1
    mov r0, r4
    bl func_02068a20
    mvn r2, #0x0
    cmp r0, r2
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT2
    mov r0, r4
    bl func_02068a20
    mvn r2, #0x0
    cmp r0, r2
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT3
    mov r0, r4
    bl func_02068a20
    mvn r1, #0x0
    cmp r0, r1
    bne .L_164
    ldr r1, _LIT3
    mov r0, r4
    mov r2, #0x0
    bl func_02068a20
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_164:
    ldr r1, _LIT4
    mov r0, r4
    mvn r2, #0x0
    bl func_02068a20
    mvn r1, #0x0
    cmp r0, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT5
    mov r0, r4
    mov r2, #0x0
    bl func_02068a20
    ldmia sp!, {r4, pc}
_LIT0: .word data_020ff988
_LIT1: .word data_020ff994
_LIT2: .word data_020ff9a0
_LIT3: .word data_020ff9ac
_LIT4: .word data_020ff9b8
_LIT5: .word data_020ff980
