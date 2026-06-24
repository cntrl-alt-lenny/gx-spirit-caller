; func_0204f34c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_02045948
        .extern func_02049868
        .extern func_0204987c
        .extern func_02094398
        .extern func_02094500
        .global func_0204f34c
        .arm
func_0204f34c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0xc]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x174]
    bl func_0204987c
    mov r5, r0
    mov r0, #0x10000
    bl func_02045948
    add r1, r5, #0x100
    strh r0, [r1, #0x76]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x178]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x17c]
    str r1, [r0, #0x180]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x184]
    str r1, [r0, #0x188]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x19c]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a1]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a2]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a3]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a4]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x19f]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a0]
    bl func_0204987c
    mov r1, #0x0
    add r0, r0, #0x100
    strh r1, [r0, #0xaa]
    bl func_0204987c
    mov r1, #0x0
    add r0, r0, #0x100
    strh r1, [r0, #0xac]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1b0]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1d8]
    str r1, [r0, #0x1dc]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1e8]
    str r1, [r0, #0x1ec]
    bl func_0204987c
    add r1, r0, #0x3c4
    mov r0, #0x0
    mov r2, #0x98
    bl Fill32
    cmp r4, #0x2
    bne .L_17c
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    strb r0, [r4, #0x14]
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_158
    mov r0, #0x1
    bl func_02049868
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_158:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    mov r0, #0xa
    bl func_02049868
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_17c:
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0xd]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0xe]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x14]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x17]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x20]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0xe8]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x19d]
    bl func_0204987c
    mov r1, #0x0
    add r0, r0, #0x100
    strh r1, [r0, #0xa8]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1b4]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1b8]
    str r1, [r0, #0x1bc]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1c0]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1c4]
    str r1, [r0, #0x1c8]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1cc]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1fc]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x200]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x2e8]
    bl func_0204987c
    add r1, r0, #0x24
    mov r0, #0x0
    mov r2, #0x80
    bl Fill32
    bl func_0204987c
    add r1, r0, #0xa4
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094398
    bl func_0204987c
    add r1, r0, #0xf4
    mov r0, #0x0
    mov r2, #0x80
    bl Fill32
    bl func_0204987c
    add r1, r0, #0x18c
    mov r0, #0x0
    mov r2, #0xc
    bl Fill32
    bl func_0204987c
    add r1, r0, #0x208
    mov r0, #0x0
    mov r2, #0x80
    bl Fill32
    bl func_0204987c
    add r1, r0, #0x288
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094398
    bl func_0204987c
    add r0, r0, #0x2c8
    mov r1, #0x0
    mov r2, #0x20
    bl func_02094500
    bl func_0204987c
    add r1, r0, #0x340
    mov r0, #0x0
    mov r2, #0x84
    bl Fill32
    cmp r4, #0x1
    bne .L_334
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_310
    mov r0, #0x3
    bl func_02049868
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_310:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    mov r0, #0x4
    bl func_02049868
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_334:
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x15]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x16]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x18]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x204]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x19e]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a6]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a5]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1f0]
    str r1, [r0, #0x1f4]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x464]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x468]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
