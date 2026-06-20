; func_ov002_022a6d1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229d2c8
        .extern func_ov002_0229e14c
        .extern func_ov002_0229e814
        .global func_ov002_022a6d1c
        .arm
func_ov002_022a6d1c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r5, r0
    add r6, r5, #0x3e0
    mov r4, #0x0
.L_10:
    mov r0, r6
    bl func_ov002_0229e14c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r4, r4, #0x1
    cmp r4, #0x2
    add r6, r6, #0xcc
    blt .L_10
    mov r4, #0x0
    add r8, r5, #0x1b8
    add r9, r5, #0x280
    mov fp, r4
    mov r6, #0x2c
.L_48:
    mov r7, fp
    mov sl, r8
.L_50:
    mov r0, sl
    bl func_ov002_0229d2c8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r7, r7, #0x1
    cmp r7, #0x5
    add sl, sl, #0x14
    blt .L_50
    mov sl, #0x0
    mov r7, r5
.L_7c:
    mov r0, r7
    bl func_ov002_0229d2c8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add sl, sl, #0x1
    cmp sl, #0xa
    add r7, r7, #0x14
    ble .L_7c
    mov r7, #0xc
.L_a4:
    sub r1, r7, #0xc
    mla r0, r1, r6, r9
    bl func_ov002_0229e814
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r7, r7, #0x1
    cmp r7, #0xf
    ble .L_a4
    add r4, r4, #0x1
    cmp r4, #0x2
    add r8, r8, #0x64
    add r5, r5, #0xdc
    add r9, r9, #0xb0
    blt .L_48
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
