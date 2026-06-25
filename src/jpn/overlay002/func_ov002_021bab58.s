; func_ov002_021bab58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b9dec
        .global func_ov002_021bab58
        .arm
func_ov002_021bab58:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r2, r4, #0x1
    mla r0, r2, r0, r3
    mov r7, r1
    add r6, r0, #0x64
    mov r5, #0x5
.L_258:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9dec
    cmp r0, #0x0
    ble .L_284
    ldrh r1, [r6, #0x38]
    cmp r1, #0x0
    beq .L_284
    cmp r0, r7
    moveq r0, r5
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_284:
    add r5, r5, #0x1
    cmp r5, #0xa
    add r6, r6, #0x14
    ble .L_258
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
