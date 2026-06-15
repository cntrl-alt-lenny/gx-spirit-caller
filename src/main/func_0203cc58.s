; func_0203cc58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0203c730
        .extern func_0203c7d0
        .extern func_0203c888
        .extern func_0203c89c
        .extern func_0203dae0
        .extern func_0203de80
        .extern func_0203e2f0
        .extern func_0203eb48
        .extern func_0203ec1c
        .extern func_0203f094
        .global func_0203cc58
        .arm
func_0203cc58:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl func_0203c888
    mov r5, r0
    cmp r5, #0x1
    bne .L_bc
    bl func_0203ec1c
    mov r5, r0
    b .L_130
.L_bc:
    cmp r5, #0x7
    bcs .L_e4
    bl OS_DisableIrq
    mov r4, r0
    bl func_0203eb48
    mov r5, r0
    bl func_0203c89c
    mov r0, r4
    bl OS_RestoreIrq
    b .L_130
.L_e4:
    cmp r5, #0x9
    bcs .L_f8
    bl func_0203dae0
    mov r5, r0
    b .L_130
.L_f8:
    cmp r5, #0xa
    bcs .L_10c
    bl func_0203e2f0
    mov r5, r0
    b .L_130
.L_10c:
    cmp r5, #0x10
    bcs .L_120
    bl func_0203f094
    mov r5, r0
    b .L_130
.L_120:
    cmp r5, #0x11
    bne .L_130
    bl func_0203de80
    mov r5, r0
.L_130:
    mov r0, r5
    bl func_0203c89c
    cmp r5, #0x10
    bne .L_158
    bl func_0203c730
    mov r4, r0
    bl func_0203c7d0
    add sp, sp, #0x4
    mov r0, r4
    ldmia sp!, {r4, r5, pc}
.L_158:
    cmp r5, #0x12
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, pc}
    bl func_0203c7d0
    mvn r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
