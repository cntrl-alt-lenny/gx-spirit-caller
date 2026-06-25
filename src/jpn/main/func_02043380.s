; func_02043380 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020feac4
        .extern data_020fead8
        .extern data_0219d910
        .extern data_0219d918
        .extern data_0219d91c
        .extern func_02043118
        .extern func_0209275c
        .extern func_02094500
        .global func_02043380
        .arm
func_02043380:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1]
    ldr r4, [r5]
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x4
    ldmneia sp!, {r4, r5, pc}
    ldr r0, _LIT1
    ldr r1, _LIT2
    blx r4
    ldr r1, _LIT0
    cmp r0, #0x0
    str r0, [r1]
    addeq sp, sp, #0x4
    moveq r0, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r2, _LIT2
    mov r1, #0x0
    bl func_02094500
    ldr r1, _LIT0
    ldr r2, _LIT3
    ldr r0, [r1]
    ldr r3, _LIT4
    add r0, r0, #0x1000
    str r2, [r0, #0x4]
    ldr ip, [r1]
    ldmia r5, {r0, r1, r2}
    add r3, ip, r3
    stmia r3, {r0, r1, r2}
    ldr r0, _LIT5
    ldr r0, [r0]
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x4
    ldmneia sp!, {r4, r5, pc}
    ldr r0, _LIT6
    ldr r1, _LIT7
    blx r4
    ldr r1, _LIT5
    cmp r0, #0x0
    str r0, [r1]
    addeq sp, sp, #0x4
    moveq r0, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r1, _LIT0
    ldr r0, _LIT8
    ldr r2, [r1]
    ldr r1, _LIT9
    mov r3, #0x0
    add r0, r2, r0
    str r3, [r1]
    bl func_0209275c
    bl func_02043118
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219d910
_LIT1: .word data_020feac4
_LIT2: .word 0x000011f4
_LIT3: .word 0xfffe7961
_LIT4: .word 0x00001108
_LIT5: .word data_0219d91c
_LIT6: .word data_020fead8
_LIT7: .word 0x00001c10
_LIT8: .word 0x000011dc
_LIT9: .word data_0219d918
