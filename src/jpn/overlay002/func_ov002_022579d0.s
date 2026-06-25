; func_ov002_022579d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_ov002_0225737c
        .global func_ov002_022579d0
        .arm
func_ov002_022579d0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    mov r8, r1
    mov r4, #0x0
    bl func_ov002_0225737c
    movs r5, r0
    ldr r0, _LIT0
    mov r6, r4
    str r6, [r0, #0x5c0]
    ldrne r0, [r5, #0x8]
    cmpne r0, #0x0
    beq .L_7c
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r8, #0x1
    mla r7, r1, r0, r2
.L_40:
    ldr r0, [r7, #0x40]
    mov r0, r0, lsr #0x2
    tst r0, #0x1
    bne .L_6c
    ldr r3, [r5, #0x8]
    mov r0, r9
    mov r1, r8
    mov r2, r6
    blx r3
    cmp r0, #0x0
    addne r4, r4, #0x1
.L_6c:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r7, r7, #0x14
    ble .L_40
.L_7c:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
