; func_ov007_021b2ad0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020215d8
        .extern func_ov007_021b2d0c
        .extern func_ov007_021b2d3c
        .global func_ov007_021b2ad0
        .arm
func_ov007_021b2ad0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    beq .L_28
    cmp r1, #0x1
    beq .L_4c
    cmp r1, #0x2
    beq .L_80
    b .L_88
.L_28:
    ldr r1, [r4, #0xc]
    cmp r1, #0x2
    bne .L_88
    bl func_ov007_021b2d0c
    mov r0, #0x1
    str r0, [r4, #0x8]
    mov r0, #0x0
    str r0, [r4, #0xc]
    b .L_88
.L_4c:
    ldr r0, [r4]
    bl func_020215d8
    cmp r0, #0x0
    bne .L_74
    mov r1, #0x0
    str r1, [r4]
    mov r0, #0x2
    str r0, [r4, #0x8]
    str r1, [r4, #0xc]
    b .L_88
.L_74:
    mov r0, r4
    bl func_ov007_021b2d3c
    b .L_88
.L_80:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_88:
    ldr r1, [r4, #0xc]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0xc]
    ldmia sp!, {r4, pc}
