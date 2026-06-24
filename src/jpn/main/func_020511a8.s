; func_020511a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff8e4
        .extern func_02048fc4
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204a47c
        .extern func_0204aa80
        .extern func_0204ab14
        .extern func_0204d210
        .extern func_0204d3c4
        .extern func_0204f29c
        .extern func_020515a4
        .extern func_02068f04
        .global func_020511a8
        .arm
func_020511a8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r5, r2
    mov r6, r0
    mov r4, r3
    mov r2, r1
    mov r3, r5
    mov r0, #0x3
    mov r1, #0x0
    bl func_0204f29c
    bl func_0204987c
    str r4, [r0, #0x464]
    bl func_0204987c
    ldr r1, [sp, #0x28]
    str r1, [r0, #0x468]
    bl func_0204987c
    mov r1, #0x1
    strb r1, [r0, #0x17]
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldr r0, [r0, #0x1f8]
    str r0, [r4, #0x20]
    bl func_0204987c
    str r6, [r0, #0xf4]
    mov r0, #0x4
    bl func_02049868
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    bne .L_d4
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    mov r2, r0
    mov r0, #0x14
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r3, #0x0
    str r3, [sp, #0x8]
    ldr r0, _LIT0
    str r0, [sp, #0xc]
    str r3, [sp, #0x10]
    ldr r0, [r5, #0x2ec]
    ldr r1, [r4, #0x2ec]
    ldr r2, [r2, #0x2f0]
    bl func_02068f04
    str r0, [r6, #0xe4]
.L_d4:
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    bne .L_f8
    mov r0, #0x5
    bl func_0204aa80
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, pc}
.L_f8:
    ldr r1, _LIT1
    mov r0, #0x5
    mov r2, #0x0
    bl func_02048fc4
    bl func_0204ab14
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, pc}
    bl func_0204987c
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    bne .L_140
    bl func_0204987c
    ldr r0, [r0, #0x1f8]
    bl func_020515a4
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, pc}
.L_140:
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    mov r1, #0x0
    bl func_0204d210
    bl func_0204d3c4
    cmp r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word func_0204a47c
_LIT1: .word data_020ff8e4
