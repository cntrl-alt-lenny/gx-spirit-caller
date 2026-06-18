; func_ov002_022537f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021bb418
        .extern func_ov002_021d95fc
        .global func_ov002_022537f8
        .arm
func_ov002_022537f8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    mov r4, #0x0
    ldr r3, [r0, #0xd4]
    ldr r0, _LIT1
    ldr lr, _LIT2
    mov r1, r4
    mov r2, #0xa
    mov r5, #0x1
.L_24:
    and r6, r1, #0x1
    mla r8, r6, lr, r0
    ldr r6, [r8, #0xf8]
    mov r6, r6, lsl #0x13
    movs r7, r6, lsr #0x13
    addne ip, r8, #0x100
    ldrneh r6, [ip]
    cmpne r6, #0x0
    beq .L_64
    ldr r6, [r8, #0x108]
    mov ip, r6, lsr #0x2
    orr ip, ip, r6, lsr #0x1
    tst ip, #0x1
    bne .L_64
    tst r3, r5, lsl r2
    moveq r4, r7
.L_64:
    add r1, r1, #0x1
    cmp r1, #0x2
    add r2, r2, #0x10
    blt .L_24
    cmp r4, #0x0
    bne .L_8c
    ldr r0, _LIT3
    bl func_ov002_021bb418
    cmp r0, #0x0
    ldrne r4, _LIT4
.L_8c:
    ldr r0, _LIT0
    ldr r0, [r0, #0xdc]
    cmp r0, r4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r4
    bl func_ov002_021d95fc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word 0x000013a2
_LIT4: .word 0x000010f4
