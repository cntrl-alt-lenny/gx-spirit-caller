; func_0209c0dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8460
        .extern data_021a84c0
        .extern data_021a8ae0
        .extern func_020919d8
        .extern func_02091d24
        .extern func_02092904
        .extern func_02094504
        .extern func_02094688
        .extern func_02096434
        .extern func_0209c090
        .extern func_0209d3dc
        .extern func_0209d438
        .global func_0209c0dc
        .arm
func_0209c0dc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    ldr r1, _LIT1
    mvn r2, #0x2
    mov r0, #0x0
    str r2, [r4, #0x8]
    mov r2, #0x60
    str r0, [r4, #0xc]
    str r0, [r4, #0x18]
    str r1, [r4]
    bl func_02094504
    ldr r0, _LIT1
    mov r1, #0x60
    bl func_02092904
    ldr r0, _LIT2
    ldrh r0, [r0]
    cmp r0, #0x2
    beq .L_5c
    ldr r0, _LIT3
    ldr r1, _LIT4
    mov r2, #0x160
    bl func_02094688
.L_5c:
    mov r2, #0x0
    str r2, [r4, #0x14]
    ldr r0, [r4, #0x14]
    mov r1, #0x4
    str r0, [r4, #0x10]
    str r2, [r4, #0x110]
    ldr r3, [r4, #0x110]
    mov r0, #0x400
    str r3, [r4, #0x10c]
    str r1, [r4, #0x108]
    str r0, [sp]
    ldr ip, [r4, #0x108]
    ldr r1, _LIT5
    ldr r3, _LIT6
    add r0, r4, #0x44
    str ip, [sp, #0x4]
    bl func_02091d24
    add r0, r4, #0x44
    bl func_020919d8
    ldr r1, _LIT7
    mov r0, #0xb
    bl func_02096434
    ldr r0, _LIT2
    ldrh r0, [r0]
    cmp r0, #0x2
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, lr}
    bxeq lr
    mov r0, #0x1
    bl func_0209c090
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a84c0
_LIT1: .word data_021a8460
_LIT2: .word 0x027ffc40
_LIT3: .word 0x027ffe00
_LIT4: .word 0x027ffa80
_LIT5: .word func_0209d3dc
_LIT6: .word data_021a8ae0
_LIT7: .word func_0209d438
