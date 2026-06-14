; func_ov015_021b429c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov015_021b5e28
        .extern data_ov015_021b5e44
        .extern func_ov005_021ab108
        .extern func_ov005_021aca30
        .extern func_ov005_021aca64
        .extern func_ov015_021b34a4
        .extern func_ov015_021b34cc
        .global func_ov015_021b429c
        .arm
func_ov015_021b429c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x898]
    cmp r0, #0x0
    beq .L_324
    ldr r0, [r4, #0x8e8]
    cmp r0, #0x1
    ldreq r0, [r4, #0x878]
    ldreq r0, [r0, #0x54]
    cmpeq r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    ldrh r1, [r0, #0x54]
    tst r1, #0x2
    beq .L_290
    ldr r0, [r4, #0xa84]
    orr r0, r0, #0x4
    str r0, [r4, #0xa84]
    ldmia sp!, {r3, r4, r5, pc}
.L_290:
    tst r1, #0x1
    beq .L_2a8
    ldr r0, [r4, #0xa84]
    orr r0, r0, #0x8
    str r0, [r4, #0xa84]
    ldmia sp!, {r3, r4, r5, pc}
.L_2a8:
    ldrh r1, [r0, #0x56]
    tst r1, #0x40
    beq .L_2e0
    ldr r0, [r4, #0x8dc]
    cmp r0, #0x0
    blt .L_2e0
    add r0, r4, #0x880
    bl func_ov015_021b34a4
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x878]
    mov r1, #0x8000
    bl func_ov005_021aca30
    ldmia sp!, {r3, r4, r5, pc}
.L_2e0:
    tst r1, #0x80
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x874]
    ldr r5, [r4, #0x8dc]
    mov r1, #0x1
    bl func_ov005_021ab108
    sub r0, r0, #0x1
    cmp r5, r0
    ldmgeia sp!, {r3, r4, r5, pc}
    add r0, r4, #0x880
    bl func_ov015_021b34cc
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x878]
    mov r1, #0x8000
    bl func_ov005_021aca64
    ldmia sp!, {r3, r4, r5, pc}
.L_324:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x54]
    tst r0, #0x2
    ldrne r0, [r4, #0xa84]
    orrne r0, r0, #0x4
    strne r0, [r4, #0xa84]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov015_021b5e28
_LIT1: .word data_ov015_021b5e44
_LIT2: .word data_02104bac
