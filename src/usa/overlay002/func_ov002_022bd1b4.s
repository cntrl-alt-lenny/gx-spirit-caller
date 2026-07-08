; func_ov002_022bd1b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccef8
        .extern data_ov002_022cd65c
        .extern data_ov002_022d281c
        .extern func_020371b8
        .extern func_020a9698
        .extern func_ov002_022bda78
        .global func_ov002_022bd1b4
        .arm
func_ov002_022bd1b4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x0
    beq .L_28
    cmp r0, #0x1
    beq .L_b0
    cmp r0, #0x2
    beq .L_128
    b .L_144
.L_28:
    ldr r0, [r4, #0xc58]
    ldr r2, _LIT0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, #0xce8]
    ldr r1, [r4, #0xc58]
    ldr r0, _LIT1
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [r4, #0xce4]
    ldr r3, [r4, #0xce8]
    ldr r1, [r2, #0x4]
    cmp r3, r1
    mov r1, #0x0
    str r1, [sp]
    ldr r1, [r4, #0xce4]
    moveq r2, #0x0
    movne r2, #0x100
    and r1, r1, #0xff
    orr r2, r1, r2
    add r3, r4, #0xc80
    mov r1, #0x4a
    bl func_ov002_022bda78
    add r0, r4, #0x124
    ldr r1, _LIT2
    add r0, r0, #0x800
    bl func_020a9698
    mov r0, #0x1
    str r0, [r4, #0xcec]
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_144
.L_b0:
    ldr r0, [r4, #0xc64]
    ldr r5, _LIT1
    cmp r0, #0x3c
    bne .L_d8
    mov r0, #0x33
    mov r2, #0x0
    sub r1, r0, #0x34
    mov r3, #0x1
    str r2, [r4, #0xcec]
    bl func_020371b8
.L_d8:
    mov r1, #0x0
.L_dc:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_f8
    ldr r0, [r5, #0x4]
    cmp r0, #0x4a
    moveq r0, #0x1
    beq .L_10c
.L_f8:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r5, r5, #0x8
    blt .L_dc
    mov r0, #0x0
.L_10c:
    cmp r0, #0x0
    bne .L_144
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_144
.L_128:
    mov r0, #0x1
    str r0, [r4, #0xcec]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_144:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word data_ov002_022d281c
_LIT2: .word data_ov002_022ccef8
