; func_0203cc08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0203c6e0
        .extern func_0203c780
        .extern func_0203c838
        .extern func_0203c84c
        .extern func_0203da90
        .extern func_0203de30
        .extern func_0203e2a0
        .extern func_0203eaf8
        .extern func_0203ebcc
        .extern func_0203f044
        .global func_0203cc08
        .arm
func_0203cc08:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl func_0203c838
    mov r5, r0
    cmp r5, #0x1
    bne .L_24
    bl func_0203ebcc
    mov r5, r0
    b .L_98
.L_24:
    cmp r5, #0x7
    bcs .L_4c
    bl OS_DisableIrq
    mov r4, r0
    bl func_0203eaf8
    mov r5, r0
    bl func_0203c84c
    mov r0, r4
    bl OS_RestoreIrq
    b .L_98
.L_4c:
    cmp r5, #0x9
    bcs .L_60
    bl func_0203da90
    mov r5, r0
    b .L_98
.L_60:
    cmp r5, #0xa
    bcs .L_74
    bl func_0203e2a0
    mov r5, r0
    b .L_98
.L_74:
    cmp r5, #0x10
    bcs .L_88
    bl func_0203f044
    mov r5, r0
    b .L_98
.L_88:
    cmp r5, #0x11
    bne .L_98
    bl func_0203de30
    mov r5, r0
.L_98:
    mov r0, r5
    bl func_0203c84c
    cmp r5, #0x10
    bne .L_c0
    bl func_0203c6e0
    mov r4, r0
    bl func_0203c780
    add sp, sp, #0x4
    mov r0, r4
    ldmia sp!, {r4, r5, pc}
.L_c0:
    cmp r5, #0x12
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, pc}
    bl func_0203c780
    mvn r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
