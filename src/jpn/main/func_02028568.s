; func_02028568 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .extern data_0219a84c
        .extern func_02005be0
        .extern func_0201d56c
        .extern func_0201e78c
        .extern func_02021150
        .global func_02028568
        .arm
func_02028568:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, _LIT0
    mov r5, r0
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x8
    bl Fill32
    ldr r0, _LIT1
    str r5, [r0, #0x4]
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_738
    ldr r1, [r4, #0x4]
    mov r0, #0x19c
    mul r5, r1, r0
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r5
    mov r0, #0x0
    str r1, [r4]
    bl Fill32
.L_738:
    mov r0, #0x0
    bl func_02021150
    cmp r0, #0x0
    beq .L_7a8
    mov r2, #0x4000000
    ldr r0, [r2]
    ldr r1, _LIT2
    add r3, r2, #0x1000
    and r0, r0, r1
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2]
    ldr r2, [r3]
    mov r0, #0x4
    and r1, r2, r1
    orr r2, r1, #0x10
    orr r2, r2, #0x200000
    mov r1, #0x2
    str r2, [r3]
    bl func_0201d56c
    mov r0, #0x9
    mov r1, #0x2
    bl func_0201d56c
    bl func_0201e78c
    mov r0, #0x1
    bl func_02005be0
    mov r0, #0x2
    bl func_02005be0
.L_7a8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219a84c
_LIT1: .word data_0219a84c
_LIT2: .word 0xffcfffef
