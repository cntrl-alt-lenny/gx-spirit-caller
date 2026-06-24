; func_0201e564 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201d724
        .extern func_0201dde0
        .extern func_0201e478
        .extern func_02092784
        .global func_0201e564
        .arm
func_0201e564:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r1, [sl]
    mov r9, #0x0
    ldrh r7, [r1, #0xe]
    ldrh r0, [r1, #0xc]
    cmp r7, #0x0
    add r8, r1, r0
    ble .L_820
    ldr fp, _LIT0
    ldr r5, _LIT1
    ldr r6, _LIT2
    mvn r4, #0x0
.L_7b8:
    ldr r0, [r8]
    cmp r0, r6
    beq .L_800
    cmp r0, r5
    beq .L_7f0
    cmp r0, fp
    bne .L_80c
    ldrsh r0, [sl, #0x10]
    cmp r0, r4
    beq .L_80c
    mov r0, sl
    mov r1, r8
    bl func_0201d724
    b .L_80c
.L_7f0:
    mov r0, sl
    mov r1, r8
    bl func_0201dde0
    b .L_80c
.L_800:
    mov r0, sl
    mov r1, r8
    bl func_0201e478
.L_80c:
    ldr r0, [r8, #0x4]
    add r9, r9, #0x1
    cmp r9, r7
    add r8, r8, r0
    blt .L_7b8
.L_820:
    bl func_02092784
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x544c4150
_LIT1: .word 0x54444742
_LIT2: .word 0x444a424f
