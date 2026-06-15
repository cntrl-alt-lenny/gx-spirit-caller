; func_0204ca70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_0204ead0
        .extern func_02062530
        .global func_0204ca70
        .arm
func_0204ca70:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_1a38
    mov r5, #0xa
.L_19c0:
    bl func_020498f0
    mov r9, r0
    bl func_020498f0
    mov r8, r0
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    add r1, r6, #0x348
    str r1, [sp]
    ldr ip, [r0, #0x348]
    add r3, r7, r4, lsl #0x1
    add ip, ip, #0x1
    str ip, [sp, #0x4]
    add r1, r9, r4, lsl #0x2
    add r2, r8, r4, lsl #0x2
    ldrh r3, [r3, #0xa4]
    ldr r1, [r1, #0xf4]
    ldr r2, [r2, #0x24]
    mov r0, r5
    bl func_0204ead0
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r4, r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    ble .L_19c0
.L_1a38:
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x17]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x20]
    bl func_020498f0
    mov r1, #0x1
    strb r1, [r0, #0x1a8]
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062530
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a8]
    mov r0, r1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
