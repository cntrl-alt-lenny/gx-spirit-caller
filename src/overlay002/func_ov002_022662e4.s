; func_ov002_022662e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b4120
        .global func_ov002_022662e4
        .arm
func_ov002_022662e4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    ldr r5, _LIT2
    add r7, r0, #0x30
    mov r6, #0x0
.L_730:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_75c
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_021b4120
    cmp r0, #0x1
    moveq r0, r6
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_75c:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r7, r7, #0x14
    ble .L_730
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x0000151e
