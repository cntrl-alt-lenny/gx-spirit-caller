; func_ov011_021cd4b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_0201b730
        .extern func_ov011_021cd018
        .global func_ov011_021cd4b0
        .arm
func_ov011_021cd4b0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2a4]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1c
    cmp r0, #0x2
    addne sp, sp, #0x18
    ldmneia sp!, {r4, pc}
    bl func_0201b730
    ldr r2, [r4, #0x1fc]
    ldr r1, [r4, #0x200]
    mov r4, r0
    rsb r2, r2, #0x56000
    rsb r0, r1, #0x14c000
    str r2, [sp, #0x10]
    str r0, [sp, #0x14]
    tst r4, #0x2000
    beq .L_514
    add r1, sp, #0x10
    str r1, [sp]
    mov ip, #0x0
    mov r0, #0x7
    str ip, [sp, #0x4]
    str ip, [sp, #0x8]
    sub r1, r0, #0x8
    mov r2, #0x2
    mov r3, #0x1b
    str ip, [sp, #0xc]
    bl func_ov011_021cd018
.L_514:
    tst r4, #0x4000
    addeq sp, sp, #0x18
    ldmeqia sp!, {r4, pc}
    add r1, sp, #0x10
    str r1, [sp]
    mov ip, #0x0
    mov r0, #0x6
    str ip, [sp, #0x4]
    str ip, [sp, #0x8]
    sub r1, r0, #0x7
    mov r2, #0x2
    mov r3, #0x1b
    str ip, [sp, #0xc]
    bl func_ov011_021cd018
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
