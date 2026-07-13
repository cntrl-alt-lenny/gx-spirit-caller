; func_ov007_021b29d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021584
        .extern func_ov007_021b2c0c
        .extern func_ov007_021b2c3c
        .global func_ov007_021b29d0
        .arm
func_ov007_021b29d0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    beq .L_30
    cmp r1, #0x1
    beq .L_54
    cmp r1, #0x2
    beq .L_88
    b .L_90
.L_30:
    ldr r1, [r4, #0xc]
    cmp r1, #0x2
    bne .L_90
    bl func_ov007_021b2c0c
    mov r0, #0x1
    str r0, [r4, #0x8]
    mov r0, #0x0
    str r0, [r4, #0xc]
    b .L_90
.L_54:
    ldr r0, [r4]
    bl func_02021584
    cmp r0, #0x0
    bne .L_7c
    mov r1, #0x0
    str r1, [r4]
    mov r0, #0x2
    str r0, [r4, #0x8]
    str r1, [r4, #0xc]
    b .L_90
.L_7c:
    mov r0, r4
    bl func_ov007_021b2c3c
    b .L_90
.L_88:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_90:
    ldr r1, [r4, #0xc]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0xc]
    ldmia sp!, {r4, pc}
