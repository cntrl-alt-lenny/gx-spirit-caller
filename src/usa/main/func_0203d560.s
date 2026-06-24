; func_0203d560 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203f640
        .extern func_0203f6c8
        .extern func_02094688
        .global func_0203d560
        .arm
func_0203d560:
    stmdb sp!, {r4, lr}
    mov r4, r2
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_e0
    b .L_44
    b .L_40
    b .L_3c
    b .L_70
    b .L_6c
    b .L_68
    b .L_94
    b .L_bc
    b .L_e0
    b .L_e0
.L_3c:
    add r0, r0, #0x100
.L_40:
    add r0, r0, #0x100
.L_44:
    ldrb r2, [r0, #0xe6]
    add r0, r0, #0x80
    add r1, r4, #0x2
    mov r2, r2, lsl #0x1e
    mov r3, r2, lsr #0x1e
    mov r2, #0x50
    strb r3, [r4]
    bl func_02094688
    b .L_e0
.L_68:
    add r0, r0, #0x100
.L_6c:
    add r0, r0, #0x100
.L_70:
    mov r3, #0x1
    add r0, r0, #0xd1
    add r1, r4, #0x2
    mov r2, #0x14
    strb r3, [r4]
    bl func_02094688
    mov r0, #0x0
    strb r0, [r4, #0x16]
    b .L_e0
.L_94:
    mov r1, #0x2
    strb r1, [r4]
    ldr r1, _LIT0
    ldrb r2, [r0, #0xd13]
    add r1, r0, r1
    mov r0, #0xc0
    mla r0, r2, r0, r1
    add r1, r4, #0x2
    bl func_0203f640
    b .L_e0
.L_bc:
    mov r1, #0x2
    strb r1, [r4]
    ldr r1, _LIT0
    ldrb r2, [r0, #0xd13]
    add r1, r0, r1
    mov r0, #0xc0
    mla r0, r2, r0, r1
    add r1, r4, #0x2
    bl func_0203f6c8
.L_e0:
    ldrb r0, [r4]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000047c
