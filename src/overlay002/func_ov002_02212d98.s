; func_ov002_02212d98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021de408
        .extern func_ov002_021e276c
        .global func_ov002_02212d98
        .arm
func_ov002_02212d98:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r3, _LIT0
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    ldr r2, _LIT2
    add r6, r1, #0x94
    add r7, r1, #0x64
    mov r1, #0x0
    mov r5, #0x5
    mov ip, #0x1
.L_40:
    ldr lr, [r6]
    ldrh r3, [r7, #0x38]
    mov lr, lr, lsl #0x13
    mov lr, lr, lsr #0x13
    cmp r3, #0x0
    beq .L_64
    cmp lr, r2
    addeq r3, r5, r0, lsl #0x4
    orreq r1, r1, ip, lsl r3
.L_64:
    add r5, r5, #0x1
    cmp r5, #0xa
    add r6, r6, #0x14
    add r7, r7, #0x14
    blt .L_40
    mov r0, r4
    bl func_ov002_021de408
    cmp r0, #0x0
    beq .L_dc
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT3
    ldr r2, [r0, #0xcec]
    mov r1, r1, lsl #0x1f
    cmp r2, r1, lsr #0x1f
    movne r3, #0x1
    mov r0, r1, lsr #0x1f
    moveq r3, #0x0
    cmp r2, r0
    ldreq r1, _LIT3
    ldreq r1, [r1, #0xcf8]
    cmpeq r1, #0x4
    moveq r3, #0x2
    and r1, r3, #0xf
    mov r1, r1, lsl #0x4
    orr r1, r1, #0x1
    mov r2, r1, lsl #0x10
    ldrh r1, [r4]
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021e276c
.L_dc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x00001102
_LIT3: .word data_ov002_022d016c
