; func_ov002_022bd804 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1af8
        .extern data_ov002_022d28fc
        .extern func_ov002_022bdb88
        .global func_ov002_022bd804
        .arm
func_ov002_022bd804:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_65c
    b .L_570
    b .L_58c
    b .L_5c4
    b .L_618
    b .L_638
.L_570:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_65c
.L_58c:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xf
    blt .L_65c
    mov r3, #0x0
    str r3, [sp]
    ldr r2, [r4, #0xc58]
    ldr r0, _LIT1
    mov r1, #0x19
    bl func_ov002_022bdb88
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_65c
.L_5c4:
    ldr r2, _LIT1
    mov r1, #0x0
.L_5cc:
    ldr r0, [r2]
    cmp r0, #0x0
    beq .L_5e8
    ldr r0, [r2, #0x4]
    cmp r0, #0x19
    moveq r0, #0x1
    beq .L_5fc
.L_5e8:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r2, r2, #0x8
    blt .L_5cc
    mov r0, #0x0
.L_5fc:
    cmp r0, #0x0
    bne .L_65c
    mov r0, #0x3
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_65c
.L_618:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xf
    blt .L_65c
    mov r0, #0x4
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_65c
.L_638:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    add sp, sp, #0x4
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, pc}
.L_65c:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022d1af8
_LIT1: .word data_ov002_022d28fc
