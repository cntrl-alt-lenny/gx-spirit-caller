; func_ov002_021b9750 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .global func_ov002_021b9750
        .arm
func_ov002_021b9750:
    stmdb sp!, {r4, r5, r6, lr}
    mov r3, #0x0
    ldr r1, _LIT0
    ldr r4, _LIT1
    mov r2, r3
.L_14:
    and r5, r3, #0x1
    mla r6, r5, r4, r1
    mov ip, r2
    add lr, r6, #0x30
.L_24:
    ldr r6, [lr]
    mov r5, r6, lsl #0x13
    movs r5, r5, lsr #0x13
    beq .L_68
    mov r5, r6, lsl #0x2
    mov r5, r5, lsr #0x18
    mov r6, r6, lsl #0x12
    mov r5, r5, lsl #0x1
    add r5, r5, r6, lsr #0x1f
    cmp r0, r5
    bne .L_68
    and r1, r3, #0xff
    and r0, ip, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_68:
    add ip, ip, #0x1
    cmp ip, #0xa
    add lr, lr, #0x14
    ble .L_24
    add r3, r3, #0x1
    cmp r3, #0x2
    blt .L_14
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
