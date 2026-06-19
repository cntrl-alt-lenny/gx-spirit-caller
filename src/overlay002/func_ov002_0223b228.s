; func_ov002_0223b228 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_ov002_021d5a08
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .global func_ov002_0223b228
        .arm
func_ov002_0223b228:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0xd0]
    tst r1, #0x1
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, r1, lsr #0x1
    tst r1, #0x1
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_ac
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    and r1, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov lr, r0, asr #0x8
    ldr r0, _LIT1
    ldr r2, _LIT2
    and ip, r1, #0x1
    mla r3, ip, r0, r2
    and r2, lr, #0xff
    mov r0, #0x14
    smulbb r0, r2, r0
    ldrh r0, [r0, r3]
    cmp r0, #0x0
    beq .L_ac
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldrh r3, [r4]
    mov r0, r4
    bl func_ov002_021d5a08
.L_ac:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
