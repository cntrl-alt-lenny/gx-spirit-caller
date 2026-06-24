; func_02006e0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3e64
        .extern data_02104e3c
        .extern func_02006b30
        .extern func_020070e8
        .extern func_02038a84
        .extern func_0207d2c4
        .extern func_02092800
        .extern func_02097efc
        .global func_02006e0c
        .arm
func_02006e0c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14c
    mov r3, r0
    mov r4, r1
    add r0, sp, #0x104
    add r2, sp, #0x4
    mov r1, r3
    bl func_02006b30
    cmp r0, #0x0
    addeq sp, sp, #0x14c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    ldr r1, _LIT0
    bl func_020070e8
    mvn r1, #0x0
    cmp r0, r1
    ldr r0, _LIT1
    movne r5, #0x1
    ldr r0, [r0, #0x1c]
    moveq r5, #0x0
    mov r1, r4
    bl func_0207d2c4
    mov r4, r0
    cmp r5, #0x0
    beq .L_94
    add r0, sp, #0x104
    add r1, sp, #0x0
    mov r2, #0x4
    bl func_02038a84
    add r0, sp, #0x0
    mov r1, #0x4
    bl func_02092800
    ldr r0, [sp]
    cmp r4, r0, lsr #0x8
    movcs r4, #0x1
    movcc r4, #0x0
    b .L_ac
.L_94:
    ldr r1, [sp, #0x12c]
    ldr r0, [sp, #0x128]
    sub r0, r1, r0
    cmp r0, r4
    movls r4, #0x1
    movhi r4, #0x0
.L_ac:
    add r0, sp, #0x104
    bl func_02097efc
    mov r0, r4
    add sp, sp, #0x14c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020c3e64
_LIT1: .word data_02104e3c
