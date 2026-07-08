; func_ov002_021ba924 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd3d8
        .extern data_ov002_022cd3ec
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b1da0
        .extern func_ov002_021b21bc
        .extern func_ov002_021ba350
        .extern func_ov002_021ba444
        .extern func_ov002_021ba908
        .extern func_ov002_021c2af4
        .extern func_ov002_021c3070
        .extern func_ov002_021c3714
        .extern func_ov002_021c9310
        .global func_ov002_021ba924
        .arm
func_ov002_021ba924:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r7, r0
    mov r5, r2
    bl func_ov002_021c9310
    sub r1, r6, #0xb
    mov r4, r0
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_9c
    b .L_8c
    b .L_3c
    b .L_4c
    b .L_5c
    b .L_74
.L_3c:
    mov r0, r7
    mov r1, r4
    bl func_ov002_021ba444
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_4c:
    mov r0, r7
    mov r1, r4
    bl func_ov002_021ba350
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_5c:
    mov r0, r7
    mov r1, r4
    bl func_ov002_021c2af4
    mov r0, r4
    bl func_ov002_021b21bc
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_74:
    mov r0, r7
    mov r1, r4
    bl func_ov002_021c3070
    mov r0, r4
    bl func_ov002_021b21bc
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_8c:
    mov r0, r7
    mov r1, r4
    bl func_ov002_021c3714
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_9c:
    add r4, r6, r5
    cmp r4, #0xa
    ble .L_cc
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r7, r1
    ldreq r0, [r0, #0x1c]
    cmpeq r6, r0
    ldreq r0, _LIT1
    ldrne r0, _LIT2
    bl func_ov002_021ba908
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_cc:
    mov r0, r7
    mov r1, r4
    bl func_ov002_021b1da0
    ldr r2, _LIT3
    ldr r0, _LIT4
    and r1, r7, #0x1
    mla r0, r1, r0, r2
    add r1, r0, #0x30
    mov r0, #0x14
    mla r0, r4, r0, r1
    bl func_ov002_021ba908
    add r1, r6, r7, lsl #0x4
    ldr r0, _LIT5
    add r1, r5, r1
    mov r2, #0x1
    mvn r1, r2, lsl r1
    ldr r2, [r0, #0xd4]
    and r1, r2, r1
    str r1, [r0, #0xd4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cd3d8
_LIT2: .word data_ov002_022cd3ec
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022d008c
