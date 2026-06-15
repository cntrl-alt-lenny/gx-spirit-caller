; func_0204014c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe55c
        .extern data_020fe64c
        .extern data_0219d9d4
        .extern data_0219d9d8
        .extern data_021a63d0
        .extern func_0203f7c0
        .extern func_02041f04
        .extern func_02041fd0
        .extern func_02042068
        .extern func_02044610
        .extern func_02091814
        .extern func_020aaf40
        .global func_0204014c
        .arm
func_0204014c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    ldr r1, _LIT1
    bl func_020aaf40
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x1
    strne r1, [r0, #0x14]
    ldr r0, _LIT2
    ldr r1, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x1000
    ldr r2, [r0, #0x20c]
    str r2, [r1, #0xc]
    ldr r2, [r0, #0x210]
    str r2, [r1, #0x10]
    ldr r0, [r0, #0x314]
    bl func_02042068
    cmp r0, #0x0
    movne r0, #0x4
    ldmneia sp!, {r4, pc}
    cmp r4, #0x1
    bne .L_aec
    ldr r0, _LIT3
    bl func_02044610
.L_aec:
    ldr r0, _LIT2
    ldr r2, _LIT4
    ldr r3, [r0]
    add r0, r3, #0x1000
    ldr r0, [r0, #0x314]
    add r1, r3, #0x1200
    add r2, r3, r2
    bl func_0203f7c0
    ldr r2, _LIT2
    ldr r1, [r2]
    add r1, r1, #0x1000
    str r0, [r1, #0x4]
    ldr r0, [r2]
    add r0, r0, #0x1000
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    movne r0, #0x4
    ldmneia sp!, {r4, pc}
    ldr r0, [r0, #0x314]
    bl func_02041fd0
    cmp r0, #0x0
    movne r0, #0x4
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    bl func_02091814
    ldr r1, _LIT2
    ldr r2, [r1]
    sub r1, r0, #0x1
    add r0, r2, #0x1000
    ldr r0, [r0, #0x314]
    bl func_02041f04
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_020fe55c
_LIT1: .word data_020fe64c
_LIT2: .word data_0219d9d4
_LIT3: .word data_0219d9d8
_LIT4: .word 0x000011cc
_LIT5: .word data_021a63d0
