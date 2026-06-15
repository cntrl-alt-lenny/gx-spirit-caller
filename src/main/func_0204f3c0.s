; func_0204f3c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_020459f0
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0209448c
        .extern func_020945f4
        .global func_0204f3c0
        .arm
func_0204f3c0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0xc]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x17c]
    bl func_020498f0
    mov r5, r0
    mov r0, #0x10000
    bl func_020459f0
    add r1, r5, #0x100
    strh r0, [r1, #0x7e]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x180]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x184]
    str r1, [r0, #0x188]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x18c]
    str r1, [r0, #0x190]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a4]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a9]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1aa]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1ab]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1ac]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a7]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a8]
    bl func_020498f0
    mov r1, #0x0
    add r0, r0, #0x100
    strh r1, [r0, #0xb2]
    bl func_020498f0
    mov r1, #0x0
    add r0, r0, #0x100
    strh r1, [r0, #0xb4]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1b8]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1e0]
    str r1, [r0, #0x1e4]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1f0]
    str r1, [r0, #0x1f4]
    bl func_020498f0
    add r1, r0, #0x3cc
    mov r0, #0x0
    mov r2, #0x98
    bl Fill32
    cmp r4, #0x2
    bne .L_20d4
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    strb r0, [r4, #0x14]
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_20b0
    mov r0, #0x1
    bl func_020498dc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_20b0:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    mov r0, #0xa
    bl func_020498dc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_20d4:
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0xd]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0xe]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x14]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x17]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x20]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0xe8]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a5]
    bl func_020498f0
    mov r1, #0x0
    add r0, r0, #0x100
    strh r1, [r0, #0xb0]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1bc]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1c0]
    str r1, [r0, #0x1c4]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1c8]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1cc]
    str r1, [r0, #0x1d0]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1d4]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x204]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x208]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x2f0]
    bl func_020498f0
    add r1, r0, #0x24
    mov r0, #0x0
    mov r2, #0x80
    bl Fill32
    bl func_020498f0
    add r1, r0, #0xa4
    mov r0, #0x0
    mov r2, #0x40
    bl func_0209448c
    bl func_020498f0
    add r1, r0, #0xf4
    mov r0, #0x0
    mov r2, #0x80
    bl Fill32
    bl func_020498f0
    add r1, r0, #0x194
    mov r0, #0x0
    mov r2, #0xc
    bl Fill32
    bl func_020498f0
    add r1, r0, #0x210
    mov r0, #0x0
    mov r2, #0x80
    bl Fill32
    bl func_020498f0
    add r1, r0, #0x290
    mov r0, #0x0
    mov r2, #0x40
    bl func_0209448c
    bl func_020498f0
    add r0, r0, #0x2d0
    mov r1, #0x0
    mov r2, #0x20
    bl func_020945f4
    bl func_020498f0
    add r1, r0, #0x348
    mov r0, #0x0
    mov r2, #0x84
    bl Fill32
    cmp r4, #0x1
    bne .L_228c
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_2268
    mov r0, #0x3
    bl func_020498dc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_2268:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    mov r0, #0x4
    bl func_020498dc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_228c:
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x15]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x16]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x18]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x20c]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a6]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1ae]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1ad]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1f8]
    str r1, [r0, #0x1fc]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x46c]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x470]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
