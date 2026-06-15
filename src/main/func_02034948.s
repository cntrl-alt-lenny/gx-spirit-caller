; func_02034948 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032350
        .extern func_0203244c
        .extern func_020324c0
        .extern func_02094688
        .global func_02034948
        .arm
func_02034948:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r8, _LIT0
    mov r7, r0
    mov r6, r1
    add r5, sp, #0x0
.L_d8:
    bl func_02032350
    mov r1, r5
    bl func_0203244c
    movs r4, r0
    beq .L_154
    ldrh r0, [r4]
    and r0, r0, r8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, r7
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldrh r1, [r4, #0x2]
    ldrh r2, [r4, #0x4]
    add r0, r4, #0x8
    add r1, r6, r1
    bl func_02094688
    ldrb r0, [r4, #0x6]
    tst r0, #0x2
    beq .L_148
    bl func_02032350
    bl func_020324c0
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    add sp, sp, #0x4
    add r0, r1, r0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_148:
    bl func_02032350
    bl func_020324c0
    b .L_d8
.L_154:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x000007ff
