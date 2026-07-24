; func_ov002_022b51d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02104acc
        .extern data_ov002_022ccad4
        .extern data_ov002_022d10dc
        .extern data_ov002_022d1a9c
        .extern func_02022b20
        .extern func_0202c8e8
        .extern func_0202cc50
        .extern func_0202cdd0
        .extern OS_SPrintf
        .extern func_020aad04
        .extern func_ov002_022a1674
        .extern func_ov002_022b83b0
        .global func_ov002_022b51d4
        .arm
func_ov002_022b51d4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x5c
    mov r5, r0
    mov r4, r1
    bl func_0202c8e8
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x5c
    ldmeqia sp!, {r4, r5, pc}
    cmp r4, #0x0
    blt .L_3c
    ldr r0, _LIT0
    add r1, r5, #0x4
    add r2, r5, #0x8
    bl func_ov002_022b83b0
.L_3c:
    cmp r4, #0x0
    blt .L_a8
    bl func_0202c8e8
    ldr r0, [r0, #0x4]
    cmp r4, r0
    beq .L_a8
    ldr r1, _LIT1
    add r0, sp, #0x3c
    mov r2, r4
    bl OS_SPrintf
    ldr r0, _LIT2
    bl func_ov002_022a1674
    cmp r0, #0x0
    beq .L_a8
    add r1, sp, #0x0
    mov r0, #0x0
    mov r2, #0x3c
    bl Fill32
    add r0, sp, #0x4
    add r1, sp, #0x3c
    bl func_020aad04
    ldr r1, [r5, #0x4]
    add r0, sp, #0x0
    str r1, [sp, #0x24]
    ldr r1, [r5, #0x8]
    str r1, [sp, #0x28]
    bl func_02022b20
.L_a8:
    mov r0, r4
    bl func_0202cc50
    ldr r0, _LIT3
    ldrh r0, [r0, #0x54]
    tst r0, #0x800
    addeq sp, sp, #0x5c
    ldmeqia sp!, {r4, r5, pc}
    bl func_0202cdd0
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_ov002_022d1a9c
_LIT1: .word data_ov002_022ccad4
_LIT2: .word data_ov002_022d10dc
_LIT3: .word data_02104acc
