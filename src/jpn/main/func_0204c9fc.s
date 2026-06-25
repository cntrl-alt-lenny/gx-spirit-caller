; func_0204c9fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_0204ea5c
        .extern func_020624bc
        .global func_0204c9fc
        .arm
func_0204c9fc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r4, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_6fc
    mov r5, #0xa
.L_684:
    bl func_0204987c
    mov r9, r0
    bl func_0204987c
    mov r8, r0
    bl func_0204987c
    mov r7, r0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    add r1, r6, #0x340
    str r1, [sp]
    ldr ip, [r0, #0x340]
    add r3, r7, r4, lsl #0x1
    add ip, ip, #0x1
    str ip, [sp, #0x4]
    add r1, r9, r4, lsl #0x2
    add r2, r8, r4, lsl #0x2
    ldrh r3, [r3, #0xa4]
    ldr r1, [r1, #0xf4]
    ldr r2, [r2, #0x24]
    mov r0, r5
    bl func_0204ea5c
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r4, r4, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    ble .L_684
.L_6fc:
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x17]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x20]
    bl func_0204987c
    mov r1, #0x1
    strb r1, [r0, #0x1a0]
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_020624bc
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a0]
    mov r0, r1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
