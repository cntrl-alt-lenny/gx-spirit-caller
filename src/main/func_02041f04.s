; func_02041f04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9ec
        .extern func_02041978
        .extern func_020919d8
        .extern func_02091ae0
        .extern func_02091d24
        .extern func_02092844
        .global func_02041f04
        .arm
func_02041f04:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    ldr r3, _LIT0
    mov r5, r0
    add r2, r5, #0x1000
    mov ip, #0x0
    add r0, r5, r3
    mov r4, r1
    str ip, [r2, #0xc0c]
    bl func_02092844
    ldr r0, _LIT1
    add r0, r5, r0
    bl func_02092844
    add r0, r5, #0x1000
    ldr r0, [r0, #0x18]
    cmp r0, #0x1
    ldreq r0, _LIT2
    moveq r1, #0x1
    streq r1, [r0]
    ldrne r0, _LIT2
    movne r1, #0x0
    strne r1, [r0]
    add r0, r5, #0x1000
    ldr r0, [r0, #0xba0]
    cmp r0, #0x0
    beq .L_1c8
    ldr r0, _LIT3
    add r0, r5, r0
    bl func_02091ae0
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, pc}
.L_1c8:
    ldr r0, _LIT3
    mov r1, #0x1000
    str r1, [sp]
    ldr r1, _LIT4
    mov r2, r5
    add r0, r5, r0
    add r3, r5, #0x1000
    str r4, [sp, #0x4]
    bl func_02091d24
    ldr r0, _LIT3
    add r0, r5, r0
    bl func_020919d8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x00001bf4
_LIT1: .word 0x00001a14
_LIT2: .word data_0219d9ec
_LIT3: .word 0x00001b34
_LIT4: .word func_02041978
