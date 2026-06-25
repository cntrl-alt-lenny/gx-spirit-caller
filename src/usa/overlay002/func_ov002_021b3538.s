; func_ov002_021b3538 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b3414
        .global func_ov002_021b3538
        .arm
func_ov002_021b3538:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    ldr r0, _LIT0
    ldr r2, _LIT1
    and r3, r5, #0x1
    mla r2, r3, r0, r2
    mov r4, r1
    mov r0, #0x14
    mla r0, r4, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldreq r0, _LIT2
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r7, #0x0
    mov r6, r7
.L_40:
    mov r8, r6
.L_44:
    mov r0, r7
    mov r1, r8
    mov r2, r5
    mov r3, r4
    bl func_ov002_021b3414
    cmp r0, #0x0
    beq .L_78
    and r1, r7, #0xff
    and r0, r8, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_78:
    add r8, r8, #0x1
    cmp r8, #0xa
    ble .L_44
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_40
    ldr r0, _LIT2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x0000ffff
