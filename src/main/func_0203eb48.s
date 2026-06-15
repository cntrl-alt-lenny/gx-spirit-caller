; func_0203eb48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c888
        .extern func_0203c900
        .extern func_0203e460
        .extern func_0203e610
        .extern func_0203e730
        .extern func_0203e8b8
        .extern func_0203e95c
        .extern func_0207b5f8
        .global func_0203eb48
        .arm
func_0203eb48:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r0, #0x10
    bl func_0203c900
    mov r5, r0
    bl func_0203c888
    mov r4, r0
    bl func_0207b5f8
    cmp r4, #0x2
    bne .L_788
    cmp r0, #0x3
    bne .L_788
    mov r0, r5
    bl func_0203e95c
    mov r4, r0
    b .L_810
.L_788:
    cmp r4, #0x6
    bne .L_7a4
    mov r0, r5
    mov r1, r4
    bl func_0203e460
    mov r4, r0
    b .L_810
.L_7a4:
    cmp r0, #0x3
    beq .L_7b4
    cmp r0, #0x6
    bne .L_810
.L_7b4:
    mov r0, r5
    mov r1, r4
    bl func_0203e460
    mov r4, r0
    cmp r4, #0x7
    beq .L_810
    cmp r4, #0x3
    bne .L_7e4
    mov r0, r5
    bl func_0203e8b8
    mov r4, r0
    b .L_810
.L_7e4:
    cmp r4, #0x4
    bne .L_7fc
    mov r0, r5
    bl func_0203e730
    mov r4, r0
    b .L_810
.L_7fc:
    cmp r4, #0x5
    bne .L_810
    mov r0, r5
    bl func_0203e610
    mov r4, r0
.L_810:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
