; func_ov017_021b611c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208e120
        .extern func_0208e1cc
        .extern func_0209448c
        .global func_ov017_021b611c
        .arm
func_ov017_021b611c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bl func_0208e120
    add r7, r0, #0x3c0
    bl func_0208e1cc
    mov r9, #0x0
    mov r5, #0x18
    mov sl, r9
    add r8, r0, #0x3c0
    mov r6, r9
    mov r4, r9
    mov fp, r5
.L_1350:
    mov r0, r6
    mov r2, r5
    add r1, r7, sl, lsl #0x1
    bl func_0209448c
    mov r0, r4
    mov r2, fp
    add r1, r8, sl, lsl #0x1
    bl func_0209448c
    add r9, r9, #0x1
    cmp r9, #0x9
    add sl, sl, #0x20
    blt .L_1350
    bl func_0208e120
    add r0, r0, #0x3d8
    add r9, r0, #0x800
    bl func_0208e1cc
    mov r7, #0x0
    add r0, r0, #0x3d8
    mov r5, #0x28
    mov r8, r7
    add sl, r0, #0x800
    mov r6, r7
    mov r4, r7
    mov fp, r5
.L_13b0:
    mov r0, r6
    mov r2, r5
    add r1, r9, r8, lsl #0x1
    bl func_0209448c
    mov r0, r4
    mov r2, fp
    add r1, sl, r8, lsl #0x1
    bl func_0209448c
    add r7, r7, #0x1
    cmp r7, #0x9
    add r8, r8, #0x20
    blt .L_13b0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
