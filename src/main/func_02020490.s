; func_02020490 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191f40
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_02020550
        .extern func_02093a20
        .global func_02020490
        .arm
func_02020490:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    add r0, sp, #0x0
    bl func_02093a20
    ldr r1, _LIT0
    ldrh r0, [sp]
    ldr r2, [r1]
    ldrh r1, [sp, #0x2]
    add r0, r0, r2
    ldrh r2, [sp, #0x4]
    add r1, r1, r0
    ldr r0, _LIT1
    add r1, r2, r1
    mul r0, r1, r0
    add r0, r0, #0x39
    ldr r1, _LIT2
    add r0, r0, #0x3000
    str r0, [r1, #0x34]
    mov r0, #0x0
    strh r0, [r1, #0xc]
    mov r2, #0x65
    mov r0, #0x3
    strh r2, [r1, #0x8]
    bl func_0201f138
    mov r0, #0x1
    bl func_02020550
    cmp r0, #0x18
    bne .L_8c
    mov r0, #0x18
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_8c:
    cmp r0, #0x2
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word 0x027ffc3c
_LIT1: .word 0x00010dcd
_LIT2: .word data_02191f40
