; func_0203eaf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c838
        .extern func_0203c8b0
        .extern func_0203e410
        .extern func_0203e5c0
        .extern func_0203e6e0
        .extern func_0203e868
        .extern func_0203e90c
        .extern func_0207b510
        .global func_0203eaf8
        .arm
func_0203eaf8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r0, #0x10
    bl func_0203c8b0
    mov r5, r0
    bl func_0203c838
    mov r4, r0
    bl func_0207b510
    cmp r4, #0x2
    bne .L_40
    cmp r0, #0x3
    bne .L_40
    mov r0, r5
    bl func_0203e90c
    mov r4, r0
    b .L_c8
.L_40:
    cmp r4, #0x6
    bne .L_5c
    mov r0, r5
    mov r1, r4
    bl func_0203e410
    mov r4, r0
    b .L_c8
.L_5c:
    cmp r0, #0x3
    beq .L_6c
    cmp r0, #0x6
    bne .L_c8
.L_6c:
    mov r0, r5
    mov r1, r4
    bl func_0203e410
    mov r4, r0
    cmp r4, #0x7
    beq .L_c8
    cmp r4, #0x3
    bne .L_9c
    mov r0, r5
    bl func_0203e868
    mov r4, r0
    b .L_c8
.L_9c:
    cmp r4, #0x4
    bne .L_b4
    mov r0, r5
    bl func_0203e6e0
    mov r4, r0
    b .L_c8
.L_b4:
    cmp r4, #0x5
    bne .L_c8
    mov r0, r5
    bl func_0203e5c0
    mov r4, r0
.L_c8:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
