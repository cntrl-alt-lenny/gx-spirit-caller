; func_ov002_021bba3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b9dec
        .global func_ov002_021bba3c
        .arm
func_ov002_021bba3c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    ldr r4, _LIT0
    ldr r0, _LIT1
    and r3, r9, #0x1
    mla r0, r3, r0, r4
    mov r8, r1
    mov r7, r2
    add r6, r0, #0x64
    mov r5, #0x0
    mov r4, #0x5
.L_194:
    mov r0, r9
    mov r1, r4
    bl func_ov002_021b9dec
    cmp r0, #0x0
    ble .L_1ec
    cmp r0, r8
    bne .L_1ec
    ldr r3, [r6, #0x40]
    ldrh r2, [r6, #0x38]
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    mvn r1, r1
    and r0, r0, #0x1
    and r1, r2, r1
    mvn r0, r0
    tst r1, r0
    beq .L_1ec
    ldr r0, [r6, #0x3c]
    cmp r0, r7
    addcs r5, r5, #0x1
.L_1ec:
    add r4, r4, #0x1
    cmp r4, #0xa
    add r6, r6, #0x14
    ble .L_194
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
