; func_0204052c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe67c
        .extern data_0219d9cc
        .extern data_0219d9d0
        .extern data_0219d9d4
        .extern func_0204014c
        .extern func_02040478
        .extern func_020945f4
        .global func_0204052c
        .arm
func_0204052c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r5, r0
    ldr r0, [r2]
    mov r4, r1
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldr r2, [r5, #0x40]
    movne r0, #0x2
    ldmneia sp!, {r4, r5, pc}
    ldr r0, _LIT1
    ldr r1, _LIT2
    blx r2
    ldr r1, _LIT0
    cmp r0, #0x0
    str r0, [r1]
    addeq sp, sp, #0x4
    moveq r0, #0x2
    ldmeqia sp!, {r4, r5, pc}
    ldr r2, _LIT2
    mov r1, #0x0
    bl func_020945f4
    ldr r1, _LIT0
    ldr r2, _LIT3
    ldr r0, [r1]
    ldr r3, _LIT4
    add r0, r0, #0x1000
    str r4, [r0, #0x314]
    ldr r0, [r1]
    mov r1, #0x0
    add r0, r0, r2
    mov r2, #0x1c4
    str r1, [r3]
    bl func_020945f4
    ldr r2, _LIT0
    ldr r3, _LIT5
    ldr r0, [r2]
    ldr r1, _LIT6
    add r0, r0, #0x1000
    str r3, [r0, #0x8]
    ldr lr, [r2]
    mov r4, #0x4
    add ip, lr, r1
.L_f10:
    ldmia r5!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_f10
    ldmia r5, {r0, r1}
    stmia ip, {r0, r1}
    add r0, lr, #0x1100
    mov r2, #0x0
    strh r2, [r0, #0xfe]
    ldr r1, _LIT0
    mov r0, #0x1
    ldr r1, [r1]
    add r1, r1, #0x1000
    strb r2, [r1, #0x20b]
    bl func_0204014c
    ldr r2, _LIT0
    ldr r1, [r2]
    add r1, r1, #0x1000
    str r0, [r1, #0x4]
    ldr r0, [r2]
    add r0, r0, #0x1000
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    ldr r0, _LIT7
    mov r1, #0x0
    str r1, [r0]
    bl func_02040478
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219d9d4
_LIT1: .word data_020fe67c
_LIT2: .word 0x000013f4
_LIT3: .word 0x00001008
_LIT4: .word data_0219d9d0
_LIT5: .word 0x00004e84
_LIT6: .word 0x000011cc
_LIT7: .word data_0219d9cc
