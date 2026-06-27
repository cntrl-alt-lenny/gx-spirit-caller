; func_ov002_021c2488 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b9dec
        .global func_ov002_021c2488
        .arm
func_ov002_021c2488:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, #0x0
    mov r4, r6
.L_c:
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r4, #0x1
    mla r7, r1, r0, r2
    ldr r8, _LIT2
    mov r5, #0x0
.L_24:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9dec
    sub r0, r0, r8
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_8c
    b .L_5c
    b .L_8c
    b .L_5c
    b .L_8c
    b .L_5c
    b .L_8c
    b .L_5c
.L_5c:
    ldr r3, [r7, #0x40]
    ldrh r2, [r7, #0x38]
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    mvn r1, r1
    and r0, r0, #0x1
    and r1, r2, r1
    mvn r0, r0
    tst r1, r0
    addne r6, r6, #0x1
.L_8c:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r7, r7, #0x14
    ble .L_24
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_c
    mov r0, r6
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0x00001a90
