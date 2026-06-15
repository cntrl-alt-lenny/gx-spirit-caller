; func_02006e28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3f44
        .extern data_02104f1c
        .extern func_02006b4c
        .extern func_02007104
        .extern func_02038ad4
        .extern func_0207d3ac
        .extern func_020928e8
        .extern func_02097ff0
        .global func_02006e28
        .arm
func_02006e28:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14c
    mov r3, r0
    mov r4, r1
    add r0, sp, #0x104
    add r2, sp, #0x4
    mov r1, r3
    bl func_02006b4c
    cmp r0, #0x0
    addeq sp, sp, #0x14c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    ldr r1, _LIT0
    bl func_02007104
    mvn r1, #0x0
    cmp r0, r1
    ldr r0, _LIT1
    movne r5, #0x1
    ldr r0, [r0, #0x1c]
    moveq r5, #0x0
    mov r1, r4
    bl func_0207d3ac
    mov r4, r0
    cmp r5, #0x0
    beq .L_94
    add r0, sp, #0x104
    add r1, sp, #0x0
    mov r2, #0x4
    bl func_02038ad4
    add r0, sp, #0x0
    mov r1, #0x4
    bl func_020928e8
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
    bl func_02097ff0
    mov r0, r4
    add sp, sp, #0x14c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020c3f44
_LIT1: .word data_02104f1c
