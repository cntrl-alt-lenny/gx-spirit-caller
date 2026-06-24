; func_ov002_0221e2a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021d873c
        .extern func_ov002_021de408
        .extern func_ov002_021e276c
        .extern func_ov002_021e7584
        .extern func_ov002_02257704
        .extern func_ov002_022577dc
        .extern func_ov002_02257878
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0229cf10
        .global func_ov002_0221e2a4
        .arm
func_ov002_0221e2a4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x100
    ldr r2, _LIT0
    mov r4, r0
    ldr r1, [r2, #0x5a8]
    sub r1, r1, #0x7c
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_1d0
    b .L_1b4
    b .L_14c
    b .L_110
    b .L_84
    b .L_38
.L_38:
    ldr r1, _LIT1
    ldr r3, [r1, #0x14]
    ldr r1, [r1, #0x87c]
    add r1, r3, r1
    str r1, [r2, #0x5ac]
    bl func_ov002_02257704
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de408
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e276c
    add sp, sp, #0x100
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_84:
    ldr r1, _LIT1
    mov r3, #0x0
    ldr lr, [r1, #0x14]
    ldr ip, [r1, #0x87c]
    ldr r1, [r2, #0x5ac]
    add ip, lr, ip
    sub r1, ip, r1
    str r1, [r2, #0x5ac]
    strh r3, [r4, #0xa]
    strh r3, [r4, #0x8]
    mov r1, #0x1
    strh r1, [r4, #0xc]
    ldr r1, [r2, #0x5ac]
    cmp r1, #0x0
    addle sp, sp, #0x100
    movle r0, r3
    ldmleia sp!, {r4, pc}
    bl func_ov002_022577dc
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    add r0, sp, #0x0
    ldr r2, [r1, #0x5ac]
    ldr r1, _LIT2
    bl func_ov002_0229cf10
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0x100
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_110:
    ldr r1, _LIT3
    bl func_ov002_02257878
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x7c
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    add sp, sp, #0x100
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_14c:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_1a8
    ldr r1, _LIT4
    add ip, r4, #0x8
    ldr r0, [r1, #0xd70]
    ldr r2, [r1, #0xd74]
    mov r4, r0, lsl #0x1
    ldr r1, [r1, #0xd78]
    ldrh r3, [ip, r4]
    add r1, r2, r1
    mov r2, #0x1
    orr r2, r3, r2, lsl r1
    strh r2, [ip, r4]
    bl func_ov002_021d873c
    ldr r0, _LIT0
    add sp, sp, #0x100
    ldr r1, [r0, #0x5ac]
    subs r1, r1, #0x1
    str r1, [r0, #0x5ac]
    movne r0, #0x7e
    moveq r0, #0x7c
    ldmia sp!, {r4, pc}
.L_1a8:
    add sp, sp, #0x100
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_1b4:
    ldrh r2, [r4, #0x8]
    ldrh r1, [r4, #0xa]
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_021de408
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1d0:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000119
_LIT3: .word func_ov002_021e7584
_LIT4: .word data_ov002_022d016c
